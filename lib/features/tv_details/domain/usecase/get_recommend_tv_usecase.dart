


import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details_recommend.dart';

import '../../../movie_details/domain/usecase/get_movie_detaild_usecase.dart';
import '../repositories/tv_details_base_repository.dart';

class GetTvRecommendUseCase implements UseCase<List<TvRecommended>,MovieDetailParams>{
  final BaseTvDetailsRepository baseTvDetailsRepository;

  GetTvRecommendUseCase({required this.baseTvDetailsRepository});

  @override
  Future<Either<Failure, List<TvRecommended>>> call(MovieDetailParams params) {
    return baseTvDetailsRepository.getTvRecommend(params:params);
  }
}