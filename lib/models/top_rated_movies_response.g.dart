// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedMovieResponse _$TopRatedMovieResponseFromJson(
        Map<String, dynamic> json) =>
    TopRatedMovieResponse()
      ..page = json['page'] as int?
      ..results = (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList()
      ..totalPages = json['total_pages'] as int?
      ..totalResults = json['total_results'] as int?;

Map<String, dynamic> _$TopRatedMovieResponseToJson(
        TopRatedMovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
