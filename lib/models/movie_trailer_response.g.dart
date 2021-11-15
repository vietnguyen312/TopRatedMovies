// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_trailer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieTrailerResponse _$MovieTrailerResponseFromJson(
        Map<String, dynamic> json) =>
    MovieTrailerResponse()
      ..results = (json['results'] as List<dynamic>?)
          ?.map((e) => MovieTrailer.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MovieTrailerResponseToJson(
        MovieTrailerResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
