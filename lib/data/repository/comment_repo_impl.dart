import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/comment_model.dart';
import 'comment_repo.dart';

class CommentRepoImpl implements CommentRepo {
  @override
  Future<Either<Failure, CommentModel>> addComment({
    required final String postId,
    required final String commentText,
    required final String username,
    required final String userAvatarUrl,
  }) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }
      final String userId = currentUser.uid;

      final DocumentReference commentDoc = FirebaseFirestore.instance.collection('comments').doc();
      final String commentId = commentDoc.id;

      final DocumentReference postDoc = FirebaseFirestore.instance.collection('post').doc(postId);
      final DocumentReference reelDoc = FirebaseFirestore.instance.collection('reels').doc(postId);

      final CommentModel comment = CommentModel(
        commentId: commentId,
        postId: postId,
        userId: userId,
        username: username,
        userAvatarUrl: userAvatarUrl,
        commentText: commentText,
        createdAt: FieldValue.serverTimestamp(),
      );

      await FirebaseFirestore.instance.runTransaction((final Transaction transaction) async {
        final DocumentSnapshot postSnapshot = await transaction.get(postDoc);
        final DocumentSnapshot reelSnapshot = await transaction.get(reelDoc);

        // Add comment document
        transaction.set(commentDoc, comment.toJson());

        // Only increment commentsCount if the post document exists in Firestore
        if (postSnapshot.exists) {
          final int currentCommentsCount = (postSnapshot.data() as Map<String, dynamic>?)?['commentsCount'] as int? ?? 0;
          transaction.update(postDoc, <String, dynamic>{
            'commentsCount': currentCommentsCount + 1,
          });
        } else if (reelSnapshot.exists) {
          final int currentCommentsCount = (reelSnapshot.data() as Map<String, dynamic>?)?['commentsCount'] as int? ?? 0;
          transaction.update(reelDoc, <String, dynamic>{
            'commentsCount': currentCommentsCount + 1,
          });
        }
      });

      return Right(comment);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CommentModel>>> getComments({required final String postId}) async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('comments')
          .where('postId', isEqualTo: postId)
          .get();

      final List<CommentModel> comments = querySnapshot.docs.map((final QueryDocumentSnapshot doc) {
        return CommentModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Sort in memory by createdAt descending
      comments.sort((final a, final b) {
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

      return Right(comments);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
