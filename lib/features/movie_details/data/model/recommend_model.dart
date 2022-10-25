import 'package:movie_app/features/movie_details/domain/entities/recommendation.dart';

class RecommendModel extends Recommendation {
  const RecommendModel({required int id, String? backdropPath})
      : super(id: id, backdropPath: backdropPath);

  factory RecommendModel.fromJson(Map<String, dynamic> json) => RecommendModel(
      id: json['id'],
      backdropPath:
          json['backdrop_path'] ?? '/nmGWzTLMXy9x7mKd8NKPLmHtWGa.jpg');
}
