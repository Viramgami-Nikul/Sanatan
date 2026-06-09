import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/others/setting_model.dart';
import 'setting_repo.dart';

class SettingRepoImpl implements SettingRepo {
  @override
  Future<Either<Failure, SettingModel>> getSettings({required final String userId}) async {
    try {
      final DocumentSnapshot doc = await FirebaseFirestore.instance.collection('settings').doc(userId).get();
      if (doc.exists) {
        return Right(SettingModel.fromJson(doc.data() as Map<String, dynamic>));
      } else {
        // Create default settings document
        final SettingModel defaultSettings = SettingModel(
          userId: userId,
          updatedAt: FieldValue.serverTimestamp(),
        );
        await FirebaseFirestore.instance.collection('settings').doc(userId).set(defaultSettings.toJson());
        return Right(defaultSettings);
      }
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SettingModel>> updateSettings({required final SettingModel setting}) async {
    try {
      final SettingModel updatedSetting = setting.copyWith(updatedAt: FieldValue.serverTimestamp());
      await FirebaseFirestore.instance
          .collection('settings')
          .doc(setting.userId)
          .set(updatedSetting.toJson(), SetOptions(merge: true));
      return Right(updatedSetting);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
