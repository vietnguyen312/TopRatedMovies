// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie()
  ..id = json['id'] as int?
  ..title = json['title'] as String?
  ..releaseDate = json['release_date'] == null
      ? null
      : DateTime.parse(json['release_date'] as String)
  ..posterPath = json['poster_path'] as String?
  ..voteAverage = (json['vote_average'] as num?)?.toDouble()
  ..voteCount = json['vote_count'] as int?
  ..overview = json['overview'] as String?
  ..backdropPath = json['backdrop_path'] as String?;

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'release_date': instance.releaseDate?.toIso8601String(),
      'poster_path': instance.posterPath,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
    };
