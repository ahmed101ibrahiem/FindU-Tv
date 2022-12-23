

import 'package:movie_app/features/tv/data/model/tv_model.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details_genres.dart';

class TvGenresModel extends TvGenres{
  TvGenresModel({required int id, required String name}) : super(id: id, name: name);

  factory TvGenresModel.fromJson(Map<String,dynamic>json)=>TvGenresModel(
     id: json['id'],
    name: json['name']
  );

}