import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/save_model.dart';
import 'package:santvani_app/data/models/post/post_model.dart';
import 'save_repo.dart';

class SaveRepoImpl implements SaveRepo {
  @override
  Future<Either<Failure, SaveModel>> toggleSave({
    required final String postId,
    required final bool isSaved,
  }) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }
      final String userId = currentUser.uid;
      final String saveId = '${userId}_$postId';

      final DocumentReference saveDoc = FirebaseFirestore.instance.collection('saves').doc(saveId);

      final SaveModel save = SaveModel(
        saveId: saveId,
        userId: userId,
        postId: postId,
        createdAt: FieldValue.serverTimestamp(),
      );

      if (isSaved) {
        await saveDoc.set(save.toJson());
      } else {
        await saveDoc.delete();
      }

      return Right(save);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isPostSavedByUser({
    required final String postId,
    required final String userId,
  }) async {
    try {
      final String saveId = '${userId}_$postId';
      final DocumentSnapshot saveSnapshot = await FirebaseFirestore.instance.collection('saves').doc(saveId).get();
      return Right(saveSnapshot.exists);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getSavedPosts({
    required final String userId,
  }) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('saves')
          .where('userId', isEqualTo: userId)
          .get();

      final List<String> postIds = querySnapshot.docs.map((final doc) => doc.get('postId') as String).toList();
      
      if (postIds.isEmpty) {
        return const Right(<PostModel>[]);
      }

      final List<PostModel> posts = [];
      final List<Future<DocumentSnapshot>> futures = postIds.map((final id) {
        return FirebaseFirestore.instance.collection('post').doc(id).get();
      }).toList();

      final List<DocumentSnapshot> postSnapshots = await Future.wait(futures);

      final List<String> missingPostIds = [];
      for (int i = 0; i < postSnapshots.length; i++) {
        final DocumentSnapshot snap = postSnapshots[i];
        if (snap.exists) {
          posts.add(PostModel.fromJson(snap.data() as Map<String, dynamic>));
        } else {
          missingPostIds.add(postIds[i]);
        }
      }

      if (missingPostIds.isNotEmpty) {
        final List<Future<DocumentSnapshot>> reelFutures = missingPostIds.map((final id) {
          return FirebaseFirestore.instance.collection('reels').doc(id).get();
        }).toList();

        final List<DocumentSnapshot> reelSnapshots = await Future.wait(reelFutures);

        for (final DocumentSnapshot snap in reelSnapshots) {
          if (snap.exists) {
            final Map<String, dynamic> data = snap.data() as Map<String, dynamic>;
            String caption = data['caption'] ?? '';
            if (!caption.toLowerCase().contains('reel')) {
              caption = '$caption #reel';
            }
            final Map<String, dynamic> mappedData = {
              'postId': data['reelId'] ?? snap.id,
              'uid': data['uid'] ?? '',
              'imageUrl': data['videoUrl'] ?? '',
              'caption': caption,
              'likesCount': data['likesCount'] ?? 0,
              'commentsCount': data['commentsCount'] ?? 0,
              'createdAt': data['createdAt'],
              'category': data['category'],
            };
            posts.add(PostModel.fromJson(mappedData));
          }
        }
      }

      // Sort posts in memory by createdAt descending
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
}
