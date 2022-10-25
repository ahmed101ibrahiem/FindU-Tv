

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repositories/base_movie_repository.dart';

import '../../../core/usecase/usecase.dart';

class GetTopRatedUseCase extends UseCase<List<Movie>,NoParams>{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params)async{
    return await baseMoviesRepository.getTopRateMovie();
  }
}