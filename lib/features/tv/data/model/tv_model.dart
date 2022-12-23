import 'package:movie_app/movies/domain/entities/movie.dart';

import '../../domain/entities/tv.dart';

class TvModel extends Tv {
  TvModel({required int id, required String title,
    required String backdropPath, required List<int> genreIds,
    required String overview, required double voteAverage,
  }) : super(id: id,
      backdropPath: backdropPath,
      genreIds: genreIds,
      overview: overview,

      title: title,
      voteAverage: voteAverage);

  factory TvModel.fromJson(Map<String, dynamic> json)=>
      TvModel(
          id: json['id'],
          title: json ['original_name'],
          backdropPath: json['backdrop_path']??"/ujeIjo0GTRbFJcgjhgFZda78A90.jpg",
          genreIds: List<int>.from(json['genre_ids'].map((e)=> e )),
          overview: json['overview'],
          voteAverage: json['vote_average'].toDouble(),
         );
}
