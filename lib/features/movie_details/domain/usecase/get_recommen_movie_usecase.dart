


import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failuar.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/features/movie_details/domain/entities/recommendation.dart';
import 'package:movie_app/features/movie_details/domain/repository/recommed_repossitory.dart';

class GetRecommendMovieUsecase extends UseCase<List<Recommendation>,RecommendParams>{
 final RecommendRepository recommendRepository;
 GetRecommendMovieUsecase({required this.recommendRepository});

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendParams params)async {
   return await recommendRepository.getRecommendMovie(params);
  }

}

class RecommendParams extends Equatable{
  final int recommendId;
  const RecommendParams(this.recommendId);
  @override

  List<Object?> get props =>[];
}