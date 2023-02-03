// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) => SearchResult(
      page: json['page'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => SearchResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int,
      totalResults: json['total_results'] as int,
    );

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };

SearchResultItem _$SearchResultItemFromJson(Map<String, dynamic> json) =>
    SearchResultItem(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String?,
      genreIds:
          (json['genre_ids'] as List<dynamic>).map((e) => e as int).toList(),
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['poster_path'] as String?,
      video: json['video'] as bool,
      title: json['title'] as String,
      releaseDate: json['release_date'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
    );

Map<String, dynamic> _$SearchResultItemToJson(SearchResultItem instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'video': instance.video,
      'title': instance.title,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
