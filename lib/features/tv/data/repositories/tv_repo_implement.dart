


import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/exception.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/features/tv/data/model/tv_model.dart';
import 'package:movie_app/features/tv/domain/entities/tv.dart';
import 'package:movie_app/features/tv/domain/repositories/tv_repositories.dart';

import '../data_source/tv_remote_datasource.dart';

class TvRepositories extends BaseTvRepositories{
final BaseTvRemoteDS baseTvRemoteDS;

TvRepositories({required this.baseTvRemoteDS});

  @override
  Future<Either<Failure, List<Tv>>> getTvOnTheAir()async {
    final result = await baseTvRemoteDS.getTvOnTheAir();
    try{

      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvPopular() async{
    final result = await baseTvRemoteDS.getTvPopular();
    try{

      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTvTopRated() async{
    final result = await baseTvRemoteDS.getTvTopRated();
    try{

      return Right(result);
    }on ServerException catch(e){
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}