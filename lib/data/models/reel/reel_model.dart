import 'package:freezed_annotation/freezed_annotation.dart';

part 'reel_model.freezed.dart';
part 'reel_model.g.dart';

@freezed
abstract class ReelModel with _$ReelModel {
  const factory ReelModel({
    required String reelId,
    required String uid,
    required String videoUrl,
    required String caption,
    required int likesCount,
    required int commentsCount,
    required dynamic createdAt,
    String? category,
  }) = _ReelModel;

  factory ReelModel.fromJson(Map<String, dynamic> json) =>
      _$ReelModelFromJson(json);
}
