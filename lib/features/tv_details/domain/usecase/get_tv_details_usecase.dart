

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details.dart';
import 'package:movie_app/features/tv_details/domain/repositories/tv_details_base_repository.dart';

import '../../../movie_details/domain/usecase/get_movie_detaild_usecase.dart';

class GetTvDetailsUseCase implements UseCase<TvDetails, MovieDetailParams>{
  final BaseTvDetailsRepository baseTvDetailsRepository;

  GetTvDetailsUseCase({required this.baseTvDetailsRepository});

  @override
  Future<Either<Failure, TvDetails>> call(MovieDetailParams params)async {
    return await baseTvDetailsRepository.getTvDetails(params: params);
  }

}