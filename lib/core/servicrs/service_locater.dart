

import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movie_details/data/datasource/movie_details_remote_datasource.dart';
import 'package:movie_app/features/movie_details/data/datasource/recommend_movie_remote_datasource.dart';
import 'package:movie_app/features/movie_details/data/repository/Movie_details_repo_impl.dart';
import 'package:movie_app/features/movie_details/data/repository/recommend_movie_repo_implemntation.dart';
import 'package:movie_app/features/movie_details/domain/repository/movie_details_repo.dart';
import 'package:movie_app/features/movie_details/domain/usecase/get_movie_detaild_usecase.dart';
import 'package:movie_app/features/movie_details/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/movies/data/datasources/movie_remote_datasorce.dart';
import 'package:movie_app/movies/data/repositories/movie_repository.dart';
import 'package:movie_app/movies/domain/repositories/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_play_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc.dart';

import '../../features/movie_details/domain/repository/recommed_repossitory.dart';
import '../../features/movie_details/domain/usecase/get_recommen_movie_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init(){
    /// bloc
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(getMovieDetailsUC: sl(),getRecommendMovieUsecase: sl()));
    /// UseCase
    sl.registerLazySingleton(() => GetRecommendMovieUsecase( recommendRepository: sl()));
    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));
    sl.registerLazySingleton(() => GetPoplurMovieUsecase(sl()));
    sl.registerLazySingleton(() => GetNowPlayingMovieUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUC(movieDetailRepo: sl()));
    /// Repository
    sl.registerLazySingleton<RecommendRepository>(() => RecommendMovieRepoImpl(recommendMovieRemoteDS: sl()));
    sl.registerLazySingleton<BaseMoviesRepository>(()=> MovieRepository(sl()));
    sl.registerLazySingleton<MovieDetailRepo>(() => MovieDetailsRepoImplement(movieDetailsRemoteDS: sl()));
    /// DATA SOURCE
    sl.registerLazySingleton<RecommendMovieRemoteDS>(() => RecommendMovieRemoteDSimpl());
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    sl.registerLazySingleton<MovieDetailsRemoteDS>(() => MovieDetailsRemoteDSImplement());

  }

}