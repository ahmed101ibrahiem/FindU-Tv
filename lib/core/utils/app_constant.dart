

import 'package:movie_app/features/movie_details/domain/usecase/get_movie_detaild_usecase.dart';

class AppString {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String noScreens = 'There are no screens available';

  static const String apiKey = '75619ab8547be1d3d33db02861537af6';
  static const String nowPlayingMoviePath = '$baseUrl/movie/now_playing?api_key=$apiKey';
  static const String popularMoviePath = '$baseUrl/movie/popular?api_key=$apiKey';
  static const String topRatedMoviePath = '$baseUrl/movie/top_rated?api_key=$apiKey';
  static const String baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String movieDetailsUrl(int params){
    String result = '$baseUrl/movie/$params?api_key=$apiKey';
    return result;
  }
  static  String imageUrl(String imageUrl)=>
       '$baseImageUrl$imageUrl';

  static String recommendMoviesUrl({required int movieId})=> '$baseUrl/movie/$movieId/recommendations?api_key=$apiKey';



}
