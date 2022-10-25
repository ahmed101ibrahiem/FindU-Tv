import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/domain/usecases/get_now_play_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_event.dart';
import 'package:movie_app/movies/presentation/controller/movie_state.dart';

import '../../domain/usecases/get_popular_movie_usecase.dart';
import '../../domain/usecases/get_top_rated_usecase.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  GetPoplurMovieUsecase getPoplurMovieUsecase;
  GetTopRatedUseCase getTopRatedUseCase;

  MovieBloc(this.getNowPlayingMovieUsecase, this.getPoplurMovieUsecase,
      this.getTopRatedUseCase)
      : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>(_nowPlayingMovie);

    on<GetTopRatedMovieEvent>(_topRatedMovie);

    on<GetPopularMovieEvent>(_poularMovieEvent);
  }

  FutureOr<void> _nowPlayingMovie(
      GetNowPlayingMovieEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMovieUsecase(NoParams());
    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingState: RequestState.error, nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingState: RequestState.loaded, nowPlayingMovie: r)));
  }

  FutureOr<void> _topRatedMovie(
      GetTopRatedMovieEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedUseCase(NoParams());
    result.fold(
        (l) => emit(state.copyWith(
            topRatedState: RequestState.error, topRatedMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedMovie: r, topRatedState: RequestState.loaded)));
  }

  FutureOr<void> _poularMovieEvent(
      GetPopularMovieEvent event, Emitter<MovieState> emit) async {
    final result = await getPoplurMovieUsecase(NoParams());
    result.fold(
        (l) => emit(state.copyWith(
            popularState: RequestState.error, popularMessage: l.message)),
        (r) => emit(
            state.copyWith(popularState: RequestState.loaded, popularMovie: r)));
  }
}
