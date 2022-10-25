part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendedMovie;
  final String recommendedMovieMessage;
  final RequestState recommendedMovieState;

  MovieDetailsState(
      {this.movieDetails,
      this.movieDetailsMessage = '',
      this.movieDetailsState = RequestState.loading,
      this.recommendedMovie = const [],
      this.recommendedMovieMessage = '',
      this.recommendedMovieState = RequestState.loading});

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendedMovie,
    String? recommendedMovieMessage,
    RequestState? recommendedMovieState,
  }) {
    return MovieDetailsState(
        movieDetails: movieDetails ?? this.movieDetails,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
        recommendedMovie: recommendedMovie ?? this.recommendedMovie,
        recommendedMovieMessage:
            recommendedMovieMessage ?? this.recommendedMovieMessage,
        recommendedMovieState:
            recommendedMovieState ?? this.recommendedMovieState);
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendedMovie,
        recommendedMovieState,
        recommendedMovieMessage
      ];
}
