

import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/core/utils/app_constant.dart';
import 'package:movie_app/features/movie_details/data/model/movie_details_model.dart';

import '../../domain/entities/movie_details.dart';
import '../../domain/usecase/get_movie_detaild_usecase.dart';

abstract class MovieDetailsRemoteDS{
  Future<MovieDetails> getMovieDetails(MovieDetailParams params);
}

class MovieDetailsRemoteDSImplement extends MovieDetailsRemoteDS{
  @override
  Future<MovieDetails> getMovieDetails(MovieDetailParams params) async{
    final response = await Dio().get(AppString.movieDetailsUrl(params.id));

    if (response.statusCode == 200){
      return MovieDetailsModel.fromJson(response.data);
    }else{
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }

  }

}