

import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/datasources/movie_remote_datasorce.dart';
import 'package:movie_app/movies/data/repositories/movie_repository.dart';
import 'package:movie_app/movies/domain/repositories/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_play_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init(){
    /// bloc
    sl.registerFactory(() => MovieBloc(sl()));
    /// UseCase
    sl.registerLazySingleton(() => GetNowPlayingMovieUsecase(sl()));
    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(()=> MovieRepository(sl()));
    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

  }

}