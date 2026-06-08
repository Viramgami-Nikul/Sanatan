import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/like_model.dart';

abstract class LikeRepo {
  Future<Either<Failure, LikeModel>> toggleLike({
    required String postId,
    required bool isLiked,
  });

  Future<Either<Failure, bool>> isPostLikedByUser({
    required String postId,
    required String userId,
  });
}
