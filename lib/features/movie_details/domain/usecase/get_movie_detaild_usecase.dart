

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details.dart';
import 'package:movie_app/features/movie_details/domain/repository/movie_details_repo.dart';

class GetMovieDetailsUC extends UseCase<MovieDetails,MovieDetailParams>{
  final MovieDetailRepo movieDetailRepo;

  GetMovieDetailsUC({required this.movieDetailRepo});

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailParams params) async{
    return await movieDetailRepo.getMovieDetails(params);

  }
}

class MovieDetailParams extends Equatable{
  final int id;
  MovieDetailParams({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}