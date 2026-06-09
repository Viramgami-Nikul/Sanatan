import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/save_model.dart';
import 'package:santvani_app/data/models/post/post_model.dart';

abstract class SaveRepo {
  Future<Either<Failure, SaveModel>> toggleSave({
    required String postId,
    required bool isSaved,
  });

  Future<Either<Failure, bool>> isPostSavedByUser({
    required String postId,
    required String userId,
  });

  Future<Either<Failure, List<PostModel>>> getSavedPosts({
    required String userId,
  });
}
