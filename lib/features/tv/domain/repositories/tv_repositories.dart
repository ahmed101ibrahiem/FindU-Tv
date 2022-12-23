

import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failuar.dart';

import '../entities/tv.dart';

abstract class BaseTvRepositories{
  Future<Either<Failure,List<Tv>>>getTvOnTheAir();
  Future<Either<Failure,List<Tv>>>getTvPopular();
  Future<Either<Failure,List<Tv>>>getTvTopRated();
}