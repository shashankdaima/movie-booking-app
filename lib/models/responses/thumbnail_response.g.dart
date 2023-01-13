// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thumbnail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThumbnailResponse _$ThumbnailResponseFromJson(Map<String, dynamic> json) =>
    ThumbnailResponse(
      id: json['id'] as int,
      created_at: json['created_at'] as String,
      thumbnail_url: json['thumbnail_url'] as String,
      launch_url: json['launch_url'] as String,
    );

Map<String, dynamic> _$ThumbnailResponseToJson(ThumbnailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'thumbnail_url': instance.thumbnail_url,
      'launch_url': instance.launch_url,
    };
