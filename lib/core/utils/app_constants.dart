class AppConstants{
  static const baseUrl= 'https://api.themoviedb.org/3';
  static const apiKey= '?api_key=2c3dbeba67440f889fcd067c35bc381e';
  static const nowPlayingEndPoint= '/movie/now_playing$apiKey';
  static const topRatedEndPoint= '/movie/top_rated$apiKey';
  static const popularEndPoint= '/movie/popular$apiKey';
  static const baseImageUrl= 'https://image.tmdb.org/t/p/w500';
  static String getMovieDetailsEndPoint(int movieId) => '/movie/$movieId$apiKey';
  static String getRecommendationEndPoint(int movieId) => '/movie/$movieId/recommendations$apiKey';

  static String imageUrl(String backdropPath) => '$baseImageUrl$backdropPath';
}