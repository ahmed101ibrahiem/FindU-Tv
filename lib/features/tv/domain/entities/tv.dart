import 'package:equatable/equatable.dart';

class Tv extends Equatable{
  final int id;
  final String title;
  final String backdropPath;
  final List<int> genreIds;
  final String overview;
  final double voteAverage;

  Tv({
    required this.overview,
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.voteAverage,
    required this.genreIds,
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
  ];
}
