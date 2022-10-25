

import 'package:movie_app/features/movie_details/domain/entities/movie_detail_genres.dart';

class GenresModel extends Genres{
  GenresModel({required int id, required String name}) : super(id: id, name: name);
  factory GenresModel.fromJson(Map<String,dynamic> json)=>GenresModel(
    id: json['id'],
    name: json['name']
  );
}