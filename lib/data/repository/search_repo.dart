import '../api/either.dart';
import '../errors/failure.dart';
import '../models/response_model/auth/user_data_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<UserDataModel>>> searchUsers(final String query);
}
