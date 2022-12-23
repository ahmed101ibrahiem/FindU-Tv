

import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/core/utils/api_tv_constant.dart';
import 'package:movie_app/features/tv_details/data/model/tv_details_model.dart';
import 'package:movie_app/features/tv_details/data/model/tv_recommend_model.dart';

import '../../../movie_details/domain/usecase/get_movie_detaild_usecase.dart';

abstract class BaseTvDetailsRemoteDS{
  Future<TvDetailsModel> getTvDetails(MovieDetailParams params);
  Future<List<TvRecommendedModel>> getRecommendTvDetails(MovieDetailParams params);
}

class TvDetailsRemoteDs implements BaseTvDetailsRemoteDS{
  @override
  Future<List<TvRecommendedModel>> getRecommendTvDetails(MovieDetailParams params)async {
    final response =await Dio().get(ApiTvConstant.tvRecommendUrl(tvId:params.id ));

    if(response.statusCode==200){
      return List<TvRecommendedModel>.from((response.data['results'] as List).map((e) => TvRecommendedModel.frmJson(e)));
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvDetailsModel> getTvDetails(MovieDetailParams params) async{
    final response =await Dio().get(ApiTvConstant.tvDetailsUrl(params.id));
    if(response.statusCode == 200){
      return TvDetailsModel.fromJson(response.data);
    }
    else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }
}