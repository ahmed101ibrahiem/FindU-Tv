
import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_app/features/movie_details/domain/usecase/get_movie_detaild_usecase.dart';

abstract class MovieDetailRepo{
  Future<Either<Failure,MovieDetails>> getMovieDetails(MovieDetailParams params);
}