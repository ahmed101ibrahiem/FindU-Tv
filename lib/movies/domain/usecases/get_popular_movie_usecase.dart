

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repositories/base_movie_repository.dart';

class GetPoplurMovieUsecase extends UseCase<List<Movie>,NoParams>{
  final BaseMoviesRepository baseMoviesRepository;
  GetPoplurMovieUsecase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params)async{
    return await baseMoviesRepository.getPopularMovie();
  }
}