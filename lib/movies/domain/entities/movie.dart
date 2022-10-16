import 'package:equatable/equatable.dart';

class Movie extends Equatable{
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;
  final String releaseDate;

  Movie({
    required this.overview,
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.genreIds,
    required this.releaseDate,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    title,
    overview,
    backdropPath,
    genreIds,
    voteAverage,
    releaseDate,
  ];
}
