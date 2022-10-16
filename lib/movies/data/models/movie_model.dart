import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({required int id, required String title,
    required String backdropPath, required List<int> genreIds,
    required String overview, required double voteAverage, required String releaseDate
  }) : super(id: id,
      backdropPath: backdropPath,
      genreIds: genreIds,
      overview: overview,
      releaseDate: releaseDate,
      title: title,
      voteAverage: voteAverage);

  factory MovieModel.fromJson(Map<String, dynamic> json)=>
      MovieModel(
          id: json['id'],
          title: json ['title'],
          backdropPath: json['backdrop_path'],
          genreIds: List<int>.from(json['genre_ids'].map((e)=> e )),
          overview: json['overview'],
          /// ToDo : check this
          voteAverage: json['vote_average'].toDouble(),
          releaseDate: json['release_date']);
}
