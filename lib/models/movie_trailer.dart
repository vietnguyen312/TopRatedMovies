import 'package:json_annotation/json_annotation.dart';

part 'movie_trailer.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieTrailer {
  String? key;
  String? site;

  MovieTrailer();

  factory MovieTrailer.fromJson(Map<String, dynamic> json) => _$MovieTrailerFromJson(json);

  Map<String, dynamic> toJson() => _$MovieTrailerToJson(this);
}