import 'package:json_annotation/json_annotation.dart';
import 'package:topratedmovies/models/movie_trailer.dart';

part 'movie_trailer_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MovieTrailerResponse {
  List<MovieTrailer>? results;

  MovieTrailerResponse();

  factory MovieTrailerResponse.fromJson(Map<String, dynamic> json) => _$MovieTrailerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieTrailerResponseToJson(this);
}
