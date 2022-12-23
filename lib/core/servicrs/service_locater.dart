

import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movie_details/data/datasource/movie_details_remote_datasource.dart';
import 'package:movie_app/features/movie_details/data/datasource/recommend_movie_remote_datasource.dart';
import 'package:movie_app/features/movie_details/data/repository/Movie_details_repo_impl.dart';
import 'package:movie_app/features/movie_details/data/repository/recommend_movie_repo_implemntation.dart';
import 'package:movie_app/features/movie_details/domain/repository/movie_details_repo.dart';
import 'package:movie_app/features/movie_details/domain/usecase/get_movie_detaild_usecase.dart';
import 'package:movie_app/features/movie_details/presentation/controller/movie_details_bloc.dart';
import 'package:movie_app/features/tv/data/data_source/tv_remote_datasource.dart';
import 'package:movie_app/features/tv/data/repositories/tv_repo_implement.dart';
import 'package:movie_app/features/tv/domain/repositories/tv_repositories.dart';
import 'package:movie_app/features/tv/domain/usecase/get_tv_on_the_air_usecase.dart';
import 'package:movie_app/features/tv/domain/usecase/get_tv_popular_usecase.dart';
import 'package:movie_app/features/tv/domain/usecase/get_tv_top_rated_usecase.dart';
import 'package:movie_app/features/tv/presentation/controller/tv_bloc.dart';
import 'package:movie_app/features/tv_details/data/data_source/tv_details_remote_darasource.dart';
import 'package:movie_app/features/tv_details/data/repositories/tv_details_repositories.dart';
import 'package:movie_app/features/tv_details/domain/repositories/tv_details_base_repository.dart';
import 'package:movie_app/features/tv_details/domain/usecase/get_tv_details_usecase.dart';
import 'package:movie_app/features/tv_details/presentation/controller/tv_details_bloc.dart';
import 'package:movie_app/movies/data/datasources/movie_remote_datasorce.dart';
import 'package:movie_app/movies/data/repositories/movie_repository.dart';
import 'package:movie_app/movies/domain/repositories/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_play_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_popular_movie_usecase.dart';
import 'package:movie_app/movies/domain/usecases/get_top_rated_usecase.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../features/movie_details/domain/repository/recommed_repossitory.dart';
import '../../features/movie_details/domain/usecase/get_recommen_movie_usecase.dart';
import '../../features/tv_details/domain/usecase/get_recommend_tv_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator{
  void init()async{
    /// bloc
    sl.registerFactory(() => MovieBloc(sl(),sl(),sl()));
    sl.registerFactory(() => MovieDetailsBloc(getMovieDetailsUC: sl(),getRecommendMovieUsecase: sl()));
    sl.registerFactory(() => TvBloc(getTvOnTheAirUseCase: sl(), getTvTopRatedUseCase: sl(), getTvPopularUseCase: sl()));
    sl.registerFactory(() => TvDetailsBloc(getTvRecommendUseCase: sl(), getTvDetailsUseCase: sl()));
    /// UseCase
    sl.registerLazySingleton(() => GetRecommendMovieUsecase( recommendRepository: sl()));
    sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));
    sl.registerLazySingleton(() => GetPoplurMovieUsecase(sl()));
    sl.registerLazySingleton(() => GetNowPlayingMovieUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUC(movieDetailRepo: sl()));
    sl.registerLazySingleton(() => GetTvOnTheAirUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetailsUseCase( baseTvDetailsRepository: sl()));
    sl.registerLazySingleton(() => GetTvPopularUseCase(tvRepositories: sl()));
    sl.registerLazySingleton(() => GetTvTopRatedUseCase( tvRepositories: sl(),));
    sl.registerLazySingleton(() => GetTvRecommendUseCase( baseTvDetailsRepository: sl(),));

    /// Repository
    sl.registerLazySingleton<RecommendRepository>(() => RecommendMovieRepoImpl(recommendMovieRemoteDS: sl()));
    sl.registerLazySingleton<BaseMoviesRepository>(()=> MovieRepository(sl()));
    sl.registerLazySingleton<MovieDetailRepo>(() => MovieDetailsRepoImplement(movieDetailsRemoteDS: sl()));
    sl.registerLazySingleton<BaseTvRepositories>(() => TvRepositories(baseTvRemoteDS: sl()));
    sl.registerLazySingleton<BaseTvDetailsRepository>(() => TvDetailsRepository(baseTvDetailsRemoteDS: sl()));
    /// DATA SOURCE
    sl.registerLazySingleton<RecommendMovieRemoteDS>(() => RecommendMovieRemoteDSimpl());
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
    sl.registerLazySingleton<MovieDetailsRemoteDS>(() => MovieDetailsRemoteDSImplement());
    sl.registerLazySingleton<BaseTvRemoteDS>(() => TvRemoteDataSource());
    sl.registerLazySingleton<BaseTvDetailsRemoteDS>(() => TvDetailsRemoteDs());

    /// external
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
  }


}