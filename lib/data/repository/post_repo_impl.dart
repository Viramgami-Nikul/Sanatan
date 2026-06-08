import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/post_model.dart';
import 'post_repo.dart';

class PostRepoImpl implements PostRepo {
  @override
  Future<Either<Failure, PostModel>> createPost({
    required final String localImagePath,
    required final String caption,
    final String? category,
  }) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }
      final String uid = currentUser.uid;

      // 1. Upload picked image to Firebase Storage under posts/ folder
      final File file = File(localImagePath);
      final String fileName = 'posts/${uid}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final Reference storageRef = FirebaseStorage.instance.ref().child(fileName);
      
      final UploadTask uploadTask = storageRef.putFile(file);
      final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
      final String downloadUrl = await snapshot.ref.getDownloadURL();

      // 2. Generate a post document ID in Firestore
      final DocumentReference postDoc = FirebaseFirestore.instance.collection('post').doc();
      final String postId = postDoc.id;

      final PostModel post = PostModel(
        postId: postId,
        uid: uid,
        imageUrl: downloadUrl,
        caption: caption,
        likesCount: 0,
        commentsCount: 0,
        createdAt: FieldValue.serverTimestamp(),
        category: category,
      );

      // 3. Save post document to Firestore
      await postDoc.set(post.toJson());

      // 4. Update the user's post count in their profile document
      final DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      await FirebaseFirestore.instance.runTransaction((final Transaction transaction) async {
        final DocumentSnapshot userSnapshot = await transaction.get(userDoc);
        if (userSnapshot.exists) {
          final int currentPostsCount = userSnapshot.exists ? (userSnapshot.get('postsCount') ?? 0) : 0;
          transaction.update(userDoc, <String, dynamic>{
            'postsCount': currentPostsCount + 1,
          });
        }
      });

      return Right(post);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getUserPosts({required final String uid}) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('post')
          .where('uid', isEqualTo: uid)
          .get();

      final List<PostModel> posts = querySnapshot.docs.map((final QueryDocumentSnapshot doc) {
        return PostModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Sort posts in memory by createdAt descending to avoid composite index requirements
      posts.sort((final a, final b) {
        final dynamic aTime = a.createdAt;
        final dynamic bTime = b.createdAt;
        
        if (aTime == null && bTime == null) return 0;
        if (aTime == null) return -1;
        if (bTime == null) return 1;
        
        DateTime? aDate;
        DateTime? bDate;
        if (aTime is Timestamp) {
          aDate = aTime.toDate();
        } else if (aTime is DateTime) {
          aDate = aTime;
        }
        
        if (bTime is Timestamp) {
          bDate = bTime.toDate();
        } else if (bTime is DateTime) {
          bDate = bTime;
        }
        
        if (aDate == null && bDate == null) return 0;
        if (aDate == null) return -1;
        if (bDate == null) return 1;
        return bDate.compareTo(aDate);
      });

      return Right(posts);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deletePost({required final String postId}) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }
      final String uid = currentUser.uid;

      final DocumentReference postDoc = FirebaseFirestore.instance.collection('post').doc(postId);
      final DocumentSnapshot postSnapshot = await postDoc.get();

      if (!postSnapshot.exists) {
        return const Left(ApiFailure(message: 'Post not found'));
      }

      final String postUid = postSnapshot.get('uid') as String? ?? '';
      if (postUid != uid) {
        return const Left(ApiFailure(message: 'You are not authorized to delete this post'));
      }

      // Delete post
      await postDoc.delete();

      // Decrement user's postsCount
      final DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(uid);
      await FirebaseFirestore.instance.runTransaction((final Transaction transaction) async {
        final DocumentSnapshot userSnapshot = await transaction.get(userDoc);
        if (userSnapshot.exists) {
          final int currentPostsCount = userSnapshot.get('postsCount') ?? 0;
          transaction.update(userDoc, <String, dynamic>{
            'postsCount': (currentPostsCount - 1).clamp(0, 999999),
          });
        }
      });

      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updatePostCaption({
    required final String postId,
    required final String caption,
  }) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }
      final String uid = currentUser.uid;

      final DocumentReference postDoc = FirebaseFirestore.instance.collection('post').doc(postId);
      final DocumentSnapshot postSnapshot = await postDoc.get();

      if (!postSnapshot.exists) {
        return const Left(ApiFailure(message: 'Post not found'));
      }

      final String postUid = postSnapshot.get('uid') as String? ?? '';
      if (postUid != uid) {
        return const Left(ApiFailure(message: 'You are not authorized to edit this post'));
      }

      await postDoc.update(<String, dynamic>{'caption': caption});

      return const Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
