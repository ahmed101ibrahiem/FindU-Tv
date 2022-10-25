import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details.dart';

import '../../domain/entities/recommendation.dart';
import '../../domain/usecase/get_movie_detaild_usecase.dart';
import '../../domain/usecase/get_recommen_movie_usecase.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUC getMovieDetailsUC;
  final GetRecommendMovieUsecase getRecommendMovieUsecase;
  MovieDetailsBloc({required this.getMovieDetailsUC,required this.getRecommendMovieUsecase}) : super(MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);

    on<GetMovieRecommendEvent>(_getMovieRecommend);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUC(MovieDetailParams(id: event.id));
    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsState: RequestState.error,
            movieDetailsMessage: l.message)),
        (r) => emit(state.copyWith(
            movieDetails: r, movieDetailsState: RequestState.loaded)));
  }

  FutureOr<void> _getMovieRecommend(
      GetMovieRecommendEvent event, Emitter<MovieDetailsState> emit) async {
    final result =await getRecommendMovieUsecase(RecommendParams(event.id));
    return result.fold((l) => emit(state.copyWith(
      recommendedMovieState: RequestState.error,
      recommendedMovieMessage: l.message
    )),
            (r) => emit(state.copyWith(
              recommendedMovieState: RequestState.loaded,
               recommendedMovie: r
            )));
  }
}
