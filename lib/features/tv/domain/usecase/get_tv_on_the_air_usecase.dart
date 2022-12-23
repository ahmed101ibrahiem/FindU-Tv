


import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/tv/domain/repositories/tv_repositories.dart';

import '../entities/tv.dart';

class GetTvOnTheAirUseCase extends UseCase<List<Tv>,NoParams>{
  final BaseTvRepositories tvRepositories;
  GetTvOnTheAirUseCase(this.tvRepositories);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParams params) async{
    return await tvRepositories.getTvOnTheAir();
  }

}