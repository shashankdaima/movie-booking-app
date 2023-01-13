import 'package:json_annotation/json_annotation.dart';

part 'thumbnail_response.g.dart';

@JsonSerializable()
class ThumbnailResponse {
  final int id;
  final String created_at;
  final String thumbnail_url;
  final String launch_url;
  const ThumbnailResponse(
      {required this.id,
      required this.created_at,
      required this.thumbnail_url,
      required this.launch_url});
  factory ThumbnailResponse.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailResponseFromJson(json);
}
