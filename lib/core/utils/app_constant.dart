

class AppString {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = '75619ab8547be1d3d33db02861537af6';
  static const String nowPlayingMoviePath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviePath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviePath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static  String imageUrl(String imageUrl){
    String result = '$baseImageUrl$imageUrl';
    return result;
  }


}
