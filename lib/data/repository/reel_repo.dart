import 'package:santvani_app/data/api/either.dart';
import 'package:santvani_app/data/errors/failure.dart';
import 'package:santvani_app/data/models/reel/reel_model.dart';

abstract class ReelRepo {
  Future<Either<Failure, ReelModel>> createReel({
    required String localVideoPath,
    required String caption,
    String? category,
  });

  Future<Either<Failure, List<ReelModel>>> getReels();

  Future<Either<Failure, void>> deleteReel({required String reelId});
}
