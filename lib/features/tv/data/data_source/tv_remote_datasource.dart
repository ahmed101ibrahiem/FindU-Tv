import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/core/utils/app_constant.dart';
import 'package:movie_app/features/tv/data/model/tv_model.dart';
import 'package:movie_app/features/tv/domain/entities/tv.dart';
import 'package:movie_app/features/tv/domain/repositories/tv_repositories.dart';

import '../../../../core/utils/api_tv_constant.dart';

abstract class BaseTvRemoteDS {
  Future<List<TvModel>> getTvOnTheAir();

  Future<List<TvModel>> getTvPopular();

  Future<List<TvModel>> getTvTopRated();
}

class TvRemoteDataSource implements BaseTvRemoteDS {

  @override
  Future<List<TvModel>> getTvOnTheAir() async {
    final response = await Dio().get(
        ApiTvConstant.tvOnTheAirUrl);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data['results'] as List)
          .map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTvPopular() async{
    final response = await Dio().get(
        ApiTvConstant.tvPopularUrl);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data['results'] as List)
          .map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvModel>> getTvTopRated() async{
    final response = await Dio().get(
        ApiTvConstant.tvTopRatedUrl);
    if (response.statusCode == 200) {
      return List<TvModel>.from((response.data['results'] as List)
          .map((e) => TvModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}