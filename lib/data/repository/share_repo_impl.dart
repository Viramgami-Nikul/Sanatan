import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/share_model.dart';
import 'share_repo.dart';

class ShareRepoImpl implements ShareRepo {
  @override
  Future<Either<Failure, ShareModel>> sharePost({
    required final String postId,
  }) async {
    try {
      final User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        return const Left(ApiFailure(message: 'User is not logged in'));
      }
      final String userId = currentUser.uid;

      final DocumentReference shareDoc = FirebaseFirestore.instance.collection('shares').doc();
      final String shareId = shareDoc.id;

      final DocumentReference postDoc = FirebaseFirestore.instance.collection('post').doc(postId);

      final ShareModel share = ShareModel(
        shareId: shareId,
        postId: postId,
        userId: userId,
        createdAt: FieldValue.serverTimestamp(),
      );

      await FirebaseFirestore.instance.runTransaction((final Transaction transaction) async {
        final DocumentSnapshot postSnapshot = await transaction.get(postDoc);

        // Add share document
        transaction.set(shareDoc, share.toJson());

        // Only increment sharesCount if the post document exists in Firestore
        if (postSnapshot.exists) {
          final int currentSharesCount = (postSnapshot.data() as Map<String, dynamic>?)?['sharesCount'] as int? ?? 0;
          transaction.update(postDoc, <String, dynamic>{
            'sharesCount': currentSharesCount + 1,
          });
        }
      });

      return Right(share);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
