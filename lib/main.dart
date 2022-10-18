import 'package:flutter/material.dart';
import 'package:movie_app/movies/data/datasources/movie_remote_datasorce.dart';
import 'package:movie_app/movies/data/repositories/movie_repository.dart';
import 'package:movie_app/movies/domain/repositories/base_movie_repository.dart';
import 'package:movie_app/movies/domain/usecases/get_now_play_usecase.dart';
import 'package:movie_app/start_screen.dart';

import 'movies/presentation/screens/movies_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Movie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  StartScreen(),
    );
  }
}
