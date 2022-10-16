

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repositories/base_movie_repository.dart';

class GetTopRatedUseCase{
  final BaseMoviesRepository baseMoviesRepository;
  GetTopRatedUseCase(this.baseMoviesRepository);
  Future<Either<Failure, List<Movie>>> execute()async{
    return await baseMoviesRepository.getTopRateMovie();
  }
}