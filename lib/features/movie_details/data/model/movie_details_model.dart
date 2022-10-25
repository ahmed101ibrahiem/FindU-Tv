import 'package:movie_app/features/movie_details/domain/entities/movie_detail_genres.dart';
import 'package:movie_app/features/movie_details/domain/entities/movie_details.dart';

import 'genres_model.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({required String backdropPath,
    required List<Genres> genres,
    required double voteAverage,
    required int id,
    required String overview,
    required String releaseDate,
    required String title,
    required int runtime})
      : super(
      backdropPath: backdropPath,
      genres: genres,
      voteAverage: voteAverage,
      id: id,
      overview: overview,
      releaseDate: releaseDate,
      title: title,
      runtime: runtime);


  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backdropPath: json['backdrop_path'],
          genres:List<GenresModel>.from(json['genres'] .map((e) => GenresModel.fromJson(e))) ,
          voteAverage: json['vote_average'].toDouble(),
          id: json['id'],
          overview: json['overview'],
          releaseDate:json ['release_date'],
          title:json ['title'],
          runtime:json ['runtime']);

}
