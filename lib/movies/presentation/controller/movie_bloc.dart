import 'package:flutter_bloc/flutter_bloc.dart';
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

  MovieBloc( this.getNowPlayingMovieUsecase,this.getPoplurMovieUsecase,
      this.getTopRatedUseCase)
      : super(const MovieState()) {
    on<GetNowPlayingMovieEvent>((event, emit) async {
      final result = await getNowPlayingMovieUsecase.execute();

      emit(const MovieState(nowPlayingState: RequestState.loaded));
      result.fold(
          (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message)),
          (r) => emit(state.copyWith(
              nowPlayingState: RequestState.loaded, nowPlayingMovie: r)));
    });

    on<GetTopRatedMovieEvent>((event, emit) async {
      final result = await getTopRatedUseCase.execute();
      result.fold(
          (l) => emit(state.copyWith(
              topRatedState: RequestState.error, topRatedMessage: l.message)),
          (r) => emit(state.copyWith(
              topRatedMovie: r, topRatedState: RequestState.loaded)));
    });

    on<GetPopularMovieEvent>((event, emit) async {
      final result = await getPoplurMovieUsecase.execute();
      result.fold(
          (l) => emit(state.copyWith(
              popularState: RequestState.error, popularMessage: l.message)),
          (r) => emit(
              state.copyWith(popularState: RequestState.error, popularMovie: r)));
    });
  }
}
