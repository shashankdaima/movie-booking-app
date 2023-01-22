import 'package:json_annotation/json_annotation.dart';

part "search_results.g.dart";

@JsonSerializable()
class SearchResult {
  // @JsonKey(name)
  final int page;
  final List<SearchResultItem> results;
  @JsonKey(name: "total_pages")
  final int totalPages;
  @JsonKey(name: "total_results")
  final int totalResults;

  const SearchResult({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });
  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);
}

@JsonSerializable()
class SearchResultItem {
  final bool adult;
  @JsonKey(name: "backdrop_path")
  final String? backdropPath;
  @JsonKey(name: "genre_ids")
  final List<int> genreIds;
  final int id;
  @JsonKey(name: "original_language")
  final String originalLanguage;
  @JsonKey(name: "original_title")
  final String originalTitle;
  final String overview;
  final double popularity;
  @JsonKey(name: "poster_path")
  final String? posterPath;
  final bool video;
  final String title;
  @JsonKey(name: "release_date")
  final String releaseDate;
  @JsonKey(name: "vote_average")
  final double voteAverage;
  @JsonKey(name: "vote_count")
  final int voteCount;
  const SearchResultItem({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.video,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });
  factory SearchResultItem.fromJson(Map<String, dynamic> json) =>
      _$SearchResultItemFromJson(json);
}
