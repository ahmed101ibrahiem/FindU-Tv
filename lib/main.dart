import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/tv/presentation/controller/tv_bloc.dart';
import 'package:movie_app/features/tv/presentation/screens/tv_screen.dart';

import 'core/route/route_screen.dart';
import 'core/servicrs/service_locater.dart';
import 'movies/presentation/controller/movie_bloc.dart';
import 'movies/presentation/controller/movie_event.dart';
import 'movies/presentation/screens/movie_popular_list_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator serviceLocator = ServiceLocator();
  serviceLocator.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (BuildContext context)  =>sl<MovieBloc>()..add(GetNowPlayingMovieEvent())..add(GetPopularMovieEvent())..add(GetTopRatedMovieEvent()),),
      BlocProvider(create: (context) => sl<TvBloc>()..add(GetTvTopRateEvent())..add(GetTvOnTheAirEvent())..add(GetTvTopRateEvent()),),
      ],
      child: MaterialApp(
        title: 'Flutter Movie',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF1E1E29),
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            centerTitle: true,
              backgroundColor: Color(0xFF0C0C10,),
              iconTheme: IconThemeData(color: Colors.white,size: 18),
              titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))

        ),

       //onGenerateRoute:AppRoute.onGenerateRoute,
        home: MoviePopularLis(),

      ),
    );
  }
}
