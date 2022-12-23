

class ApiTvConstant{
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String keyUrl = '75619ab8547be1d3d33db02861537af6';
  static const String tvOnTheAirUrl = '$baseUrl/tv/on_the_air?api_key=$keyUrl';
  static const String tvPopularUrl = '$baseUrl/tv/popular?api_key=$keyUrl';
  static const String tvTopRatedUrl = '$baseUrl/tv/top_rated?api_key=$keyUrl';
  static String tvRecommendUrl({required int tvId}) => '$baseUrl/tv/$tvId/recommendations?api_key=$keyUrl';
  static  String tvDetailsUrl(int param) => '$baseUrl/tv/$param?api_key=$keyUrl';
  var id = '94997';

}
