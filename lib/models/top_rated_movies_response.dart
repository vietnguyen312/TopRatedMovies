import 'package:json_annotation/json_annotation.dart';
import 'package:topratedmovies/models/movie.dart';

part 'top_rated_movies_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class TopRatedMovieResponse {
  int? page;
  List<Movie>? results;
  int? totalPages;
  int? totalResults;

  TopRatedMovieResponse();

  factory TopRatedMovieResponse.fromJson(Map<String, dynamic> json) => _$TopRatedMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopRatedMovieResponseToJson(this);
}
