

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/features/movie_details/domain/entities/recommendation.dart';

import '../usecase/get_recommen_movie_usecase.dart';

abstract class RecommendRepository {
  Future<Either<Failure,List<Recommendation>>> getRecommendMovie(RecommendParams params);
}