


import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>> getNowPlayingMovie();
  Future<Either<Failure,List<Movie>>> getPopularMovie();
  Future<Either<Failure,List<Movie>>> getTopRateMovie();
}