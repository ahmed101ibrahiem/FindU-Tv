

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movies/data/datasources/movie_remote_datasorce.dart';
import 'package:movie_app/movies/data/repositories/movie_repository.dart';
import 'package:movie_app/movies/domain/repositories/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_play_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_event.dart';
import 'package:movie_app/movies/presentation/controller/movie_state.dart';


  class MovieBloc extends Bloc<MovieEvent,MovieState>{
    GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  MovieBloc(this.getNowPlayingMovieUsecase) : super(const MovieState()){
    on<GetNowPlayingMovieEvent>((event, emit)async {
      final result =await getNowPlayingMovieUsecase.execute();

      emit (const MovieState(nowPlayingState: RequestState.loaded));
      result.fold((l) => emit(MovieState(nowPlayingState: RequestState.error,nowPlayingMessage: l.message)),
              (r) => emit(MovieState(nowPlayingState: RequestState.loaded,nowPlayingMovie: r)));
    });
  }
}