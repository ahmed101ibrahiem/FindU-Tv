


import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/features/movie_details/data/datasource/movie_details_remote_datasource.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_app/features/movie_details/domain/repository/movie_details_repo.dart';

import '../../domain/usecase/get_movie_detaild_usecase.dart';

class MovieDetailsRepoImplement extends MovieDetailRepo{
  final MovieDetailsRemoteDS movieDetailsRemoteDS;

  MovieDetailsRepoImplement({required this.movieDetailsRemoteDS});

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(MovieDetailParams params) async{
    final result = await movieDetailsRemoteDS.getMovieDetails(params);
    try{
      return Right(result);
    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
    
  }
}