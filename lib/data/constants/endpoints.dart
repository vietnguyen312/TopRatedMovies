class Endpoints {
  Endpoints._();

  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 30000;

  static const apiKey = 'f7b43fb7fcb594401ceeffb0ae60be57';
  static const baseUrl = 'https://api.themoviedb.org/3/';
  static const getTopRatedMovies = baseUrl + 'movie/top_rated';
  static String moviePoster(String posterPath) => 'https://image.tmdb.org/t/p/w300/$posterPath';
  static String getMovieTrailer(int movieId) => baseUrl + 'movie/$movieId/videos';

  static const pageQueryParam = 'page';
}
