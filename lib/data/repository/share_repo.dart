import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/post/share_model.dart';

abstract class ShareRepo {
  Future<Either<Failure, ShareModel>> sharePost({
    required String postId,
  });
}
