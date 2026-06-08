import '../api/either.dart';
import '../errors/failure.dart';
import '../models/response_model/auth/user_data_model.dart';
import '../models/user/update_profile_request_model.dart';
import '../models/user/user_model.dart';


abstract class UserRepo {
  Future<UserModel> getProfile();

  Future<UserModel> updateProfile(
      UpdateProfileRequestModel request,
      );

  Future<Either<Failure, UserDataModel>> getUserProfileApi();

  Future<Either<Failure, UserDataModel>> updateProfileApi({
    required String fullName,
    required String username,
    required String bio,
  });

  Future<Either<Failure, void>> followUser(final String targetUid);
  Future<Either<Failure, void>> unfollowUser(final String targetUid);
  Future<Either<Failure, bool>> checkIsFollowing(final String targetUid);
}
