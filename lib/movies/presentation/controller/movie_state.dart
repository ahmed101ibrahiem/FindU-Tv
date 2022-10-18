import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> topRatedMovie;
  final RequestState topRatedState;
  final String topRatedMessage;
  final List<Movie> popularMovie;
  final RequestState popularState;
  final String popularMessage;

  const MovieState({
    this.nowPlayingMovie = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.topRatedMovie = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',
    this.popularMovie = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',
  });
  MovieState copyWith({
     List<Movie>? nowPlayingMovie ,
     RequestState? nowPlayingState,
     String? nowPlayingMessage,
     List<Movie>? topRatedMovie,
     RequestState? topRatedState,
    String? topRatedMessage,
    List<Movie>? popularMovie,
     RequestState? popularState,
     String? popularMessage,
}){
    return MovieState(
      nowPlayingMovie: nowPlayingMovie ?? this.nowPlayingMovie,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularState: popularState ?? this.popularState,
      popularMovie: popularMovie ?? this.popularMovie,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedState: topRatedState?? this.topRatedState,
      topRatedMovie: topRatedMovie?? this.topRatedMovie,
      topRatedMessage: topRatedMessage?? this.topRatedMessage
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovie,
        nowPlayingState,
        nowPlayingMessage,
        topRatedMessage,
        topRatedMovie,
        topRatedState,
        popularMessage,
        popularMovie,
        popularState
      ];
}
