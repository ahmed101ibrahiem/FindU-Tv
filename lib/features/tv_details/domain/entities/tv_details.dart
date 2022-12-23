import 'package:equatable/equatable.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details_genres.dart';

class TvDetails extends Equatable {
  final String backdropPath;
  final String date;
  final double voteAverage;
  final int id;
  final List<TvGenres> genres;
  final String name;
  final int numberOfEpisodes;
  final int numberOfSeasons;
  final String posterPath;
  final String overview;

  const TvDetails(
      {required this.backdropPath,
      required this.date,
      required this.voteAverage,
      required this.id,
      required this.genres,
      required this.name,
      required this.numberOfEpisodes,
      required this.numberOfSeasons,
      required this.posterPath,
      required this.overview});

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        date,
        voteAverage,
        id,
        genres,
        name,
        numberOfEpisodes,
        numberOfSeasons,
        posterPath,
        overview
      ];
}
