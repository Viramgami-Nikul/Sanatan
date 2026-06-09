import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/others/setting_model.dart';

abstract class SettingRepo {
  Future<Either<Failure, SettingModel>> getSettings({required String userId});
  Future<Either<Failure, SettingModel>> updateSettings({required SettingModel setting});
}
