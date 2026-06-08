import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/comment_model.dart';

abstract class CommentRepo {
  Future<Either<Failure, CommentModel>> addComment({
    required String postId,
    required String commentText,
    required String username,
    required String userAvatarUrl,
  });

  Future<Either<Failure, List<CommentModel>>> getComments({required String postId});
}
