import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/features/movie_details/data/datasource/recommend_movie_remote_datasource.dart';
import 'package:movie_app/features/movie_details/data/model/recommend_model.dart';
import 'package:movie_app/features/movie_details/domain/entities/recommendation.dart';
import 'package:movie_app/features/movie_details/domain/repository/recommed_repossitory.dart';
import 'package:movie_app/features/movie_details/domain/usecase/get_recommen_movie_usecase.dart';

class RecommendMovieRepoImpl implements RecommendRepository {
  final RecommendMovieRemoteDS recommendMovieRemoteDS;

  RecommendMovieRepoImpl({required this.recommendMovieRemoteDS});

  @override
  Future<Either<Failure, List<RecommendModel>>> getRecommendMovie(
      RecommendParams params) async {
    final result =await recommendMovieRemoteDS.getRemoteRecommendMovie(params);
    try{
      return Right(result);
    }
    on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }

  }
}
