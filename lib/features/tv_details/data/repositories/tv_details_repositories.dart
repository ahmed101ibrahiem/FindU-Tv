import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/features/movie_details/domain/usecase/get_movie_detaild_usecase.dart';
import 'package:movie_app/features/tv_details/data/data_source/tv_details_remote_darasource.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details_recommend.dart';
import 'package:movie_app/features/tv_details/domain/repositories/tv_details_base_repository.dart';

class TvDetailsRepository implements BaseTvDetailsRepository {
  final BaseTvDetailsRemoteDS baseTvDetailsRemoteDS;

  TvDetailsRepository({required this.baseTvDetailsRemoteDS});

  @override
  Future<Either<Failure, TvDetails>> getTvDetails(
      {required MovieDetailParams params}) async {
    final result = await baseTvDetailsRemoteDS.getTvDetails(params);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvRecommended>>> getTvRecommend(
      {required MovieDetailParams params}) async {
    final result = await baseTvDetailsRemoteDS.getRecommendTvDetails(params);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}
