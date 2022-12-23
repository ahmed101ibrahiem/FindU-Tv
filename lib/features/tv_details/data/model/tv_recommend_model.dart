

import 'package:movie_app/features/tv_details/domain/entities/tv_details_recommend.dart';

class TvRecommendedModel extends TvRecommended{
  TvRecommendedModel({ String? backdropPath, required int id, required String name}) : super(backdropPath: backdropPath, id: id, name: name);
 factory TvRecommendedModel.frmJson(Map<String,dynamic>json)=>TvRecommendedModel(
   name: json['name'],
   id: json['id'],
   backdropPath: json['backdrop_path']?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg'
 );

}