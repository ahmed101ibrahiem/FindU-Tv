


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/tv/presentation/screens/tv_screen.dart';
import 'package:movie_app/movies/presentation/screens/movies_screen.dart';

import '../../app.dart';
import '../../features/tv/presentation/screens/tv_list.dart';
import '../../movies/presentation/screens/movie_list_screen.dart';
import '../utils/app_constant.dart';

class Routes{
  static const String movieScreen = '/';
  static  const String movieDetails = '/movieDetails';
  static const String popularSeeMore = '/popularSeeMore';
  static const String topRateSeeMore = '/topRateSeeMore';
  static const String tvTopRateSeeMore = '/tvTopRateSeeMore';
  static const String tvPopularSeeMore = '/tvPopularSeeMore';
  static const String tvScreen = '/tvScreen';
}

class AppRoute{
  static Route? onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.movieScreen:
        return   MaterialPageRoute(builder: ((context) => HomeScreen()));
      case Routes.popularSeeMore:
        return MaterialPageRoute(builder: (context)=> MoviePopularLis(enyMovieList: true,));
      case Routes.topRateSeeMore:
        return MaterialPageRoute(builder: (context)=> MoviePopularLis(enyMovieList: false));
      case Routes.tvScreen:
        return MaterialPageRoute(builder: (context)=>TvScreen());
      case Routes.tvPopularSeeMore:
        return MaterialPageRoute(builder: (context)=>TvListScreen(enyMovieList: true,));
      case Routes.tvTopRateSeeMore:
        return MaterialPageRoute(builder: (context)=>TvListScreen(enyMovieList: false,));
      default:
        return defaultScreen();
    }
  }

  static Route? defaultScreen(){
    return MaterialPageRoute(builder: (context)=>const Scaffold(
      body: Center(
        child: Text(AppString.noScreens),
      ),
    ));
  }
}