import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/like_model.dart';
import 'like_repo.dart';

class LikeRepoImpl implements LikeRepo {
  @override
  Future<Either<Failure, LikeModel>> toggleLike({
    required final String postId,
    required final bool isLiked,
  }) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }
      final String userId = currentUser.uid;
      final String likeId = '${userId}_$postId';

      final DocumentReference likeDoc = FirebaseFirestore.instance.collection('likes').doc(likeId);
      final DocumentReference postDoc = FirebaseFirestore.instance.collection('post').doc(postId);

      final LikeModel like = LikeModel(
        likeId: likeId,
        userId: userId,
        postId: postId,
        createdAt: FieldValue.serverTimestamp(),
      );

      await FirebaseFirestore.instance.runTransaction((final Transaction transaction) async {
        final DocumentSnapshot postSnapshot = await transaction.get(postDoc);

        if (isLiked) {
          // Add like document
          transaction.set(likeDoc, like.toJson());
          // Only increment post like count if the post exists in Firestore
          if (postSnapshot.exists) {
            final int currentLikesCount = (postSnapshot.data() as Map<String, dynamic>?)?['likesCount'] as int? ?? 0;
            transaction.update(postDoc, <String, dynamic>{
              'likesCount': currentLikesCount + 1,
            });
          }
        } else {
          // Delete like document
          transaction.delete(likeDoc);
          // Only decrement post like count if the post exists in Firestore
          if (postSnapshot.exists) {
            final int currentLikesCount = (postSnapshot.data() as Map<String, dynamic>?)?['likesCount'] as int? ?? 0;
            transaction.update(postDoc, <String, dynamic>{
              'likesCount': currentLikesCount > 0 ? currentLikesCount - 1 : 0,
            });
          }
        }
      });

      return Right(like);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isPostLikedByUser({
    required final String postId,
    required final String userId,
  }) async {
    try {
      final String likeId = '${userId}_$postId';
      final DocumentSnapshot likeSnapshot = await FirebaseFirestore.instance.collection('likes').doc(likeId).get();
      return Right(likeSnapshot.exists);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
