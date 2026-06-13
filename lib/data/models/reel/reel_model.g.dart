// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReelModel _$ReelModelFromJson(Map<String, dynamic> json) => _ReelModel(
  reelId: json['reelId'] as String,
  uid: json['uid'] as String,
  videoUrl: json['videoUrl'] as String,
  caption: json['caption'] as String,
  likesCount: (json['likesCount'] as num).toInt(),
  commentsCount: (json['commentsCount'] as num).toInt(),
  createdAt: json['createdAt'],
  category: json['category'] as String?,
);

Map<String, dynamic> _$ReelModelToJson(_ReelModel instance) =>
    <String, dynamic>{
      'reelId': instance.reelId,
      'uid': instance.uid,
      'videoUrl': instance.videoUrl,
      'caption': instance.caption,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
      'createdAt': instance.createdAt,
      'category': instance.category,
    };
