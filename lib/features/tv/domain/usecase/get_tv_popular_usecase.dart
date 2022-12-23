

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/core/usecase/usecase.dart';

import '../entities/tv.dart';
import '../repositories/tv_repositories.dart';

class GetTvPopularUseCase extends UseCase<List<Tv>,NoParams>{
  final BaseTvRepositories tvRepositories;

  GetTvPopularUseCase({required this.tvRepositories});

  @override
  Future<Either<Failure, List<Tv>>> call(NoParams params)async {
    return await tvRepositories.getTvPopular();
  }

}