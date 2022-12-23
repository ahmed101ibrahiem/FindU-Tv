


import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details_recommend.dart';

import '../../../movie_details/domain/usecase/get_movie_detaild_usecase.dart';

abstract class BaseTvDetailsRepository{
  Future<Either<Failure,TvDetails>> getTvDetails({required MovieDetailParams params});
  Future<Either<Failure,List<TvRecommended>>> getTvRecommend( {required MovieDetailParams params});
}