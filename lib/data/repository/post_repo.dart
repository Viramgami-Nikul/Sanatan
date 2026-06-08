import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/post_model.dart';

abstract class PostRepo {
  Future<Either<Failure, PostModel>> createPost({
    required String localImagePath,
    required String caption,
    String? category,
  });

  Future<Either<Failure, List<PostModel>>> getUserPosts({required String uid});

  Future<Either<Failure, void>> deletePost({required String postId});

  Future<Either<Failure, void>> updatePostCaption({
    required String postId,
    required String caption,
  });
}
