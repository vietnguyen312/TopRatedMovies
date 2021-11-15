import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Movie {
  int? id;
  String? title;
  DateTime? releaseDate;
  String? posterPath;
  double? voteAverage;
  int? voteCount;
  String? overview;
  String? backdropPath;

  Movie();

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
