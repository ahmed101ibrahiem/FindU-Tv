

import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/features/movie_details/data/model/recommend_model.dart';
import 'package:movie_app/features/movie_details/domain/usecase/get_recommen_movie_usecase.dart';

import '../../../../core/utils/app_constant.dart';

abstract class RecommendMovieRemoteDS{
  Future<List<RecommendModel>> getRemoteRecommendMovie(RecommendParams params);
}

class RecommendMovieRemoteDSimpl implements RecommendMovieRemoteDS{
  @override
  Future<List<RecommendModel>> getRemoteRecommendMovie(RecommendParams params) async{
    final response =await Dio().get(AppString.recommendMoviesUrl( movieId: params.recommendId));
    if (response.statusCode == 200){
      return List<RecommendModel>.from((response.data['results'] as List).map((e) => RecommendModel.fromJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}