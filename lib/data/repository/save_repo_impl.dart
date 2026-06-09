import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/save_model.dart';
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
}
