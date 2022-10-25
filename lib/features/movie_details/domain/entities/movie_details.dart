import 'package:equatable/equatable.dart';

import 'movie_detail_genres.dart';

class MovieDetails extends Equatable {
  final String backdropPath;
  final List<Genres> genres;
  final double voteAverage;
  final int id;
  final String overview;
  final String releaseDate;
  final String title;
  final int runtime;

  MovieDetails(
      {required this.backdropPath,
      required this.genres,
      required this.voteAverage,
      required this.id,
      required this.overview,
      required this.releaseDate,
      required this.title,
      required this.runtime});

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        genres,
        voteAverage,
        id,
        overview,
        releaseDate,
        title,
        runtime,
      ];
}
