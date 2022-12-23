import 'package:movie_app/features/tv_details/data/model/tv_details_genres_model.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details_genres.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel(
      {required String backdropPath,
      required String date,
      required double voteAverage,
      required int id,
      required List<TvGenres> genres,
      required String name,
      required int numberOfEpisodes,
      required int numberOfSeasons,
      required String posterPath,
      required String overview})
      : super(
            backdropPath: backdropPath,
            date: date,
            voteAverage: voteAverage,
            id: id,
            genres: genres,
            name: name,
            numberOfEpisodes: numberOfEpisodes,
            numberOfSeasons: numberOfSeasons,
            posterPath: posterPath,
            overview: overview);

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
      backdropPath:json ['backdrop_path'],
      date:json ['first_air_date'],
      voteAverage: json['vote_average'].toDouble(),
      id: json['id'],
      genres: List<TvGenresModel>.from(json['genres'].map((e) => TvGenresModel.fromJson(e))),
      name: json['name'],
      numberOfEpisodes: json['number_of_episodes'],
      numberOfSeasons: json['number_of_seasons'],
      posterPath: json['poster_path'],
      overview: json['overview']);
}
