import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';

import '../../domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  const MovieState(
      { this.nowPlayingMovie =const [],
       this.nowPlayingState = RequestState.loading,
       this. nowPlayingMessage = ''});

  @override
  List<Object?> get props => [
    nowPlayingMovie,
    nowPlayingState,
    nowPlayingMessage
  ];
}
