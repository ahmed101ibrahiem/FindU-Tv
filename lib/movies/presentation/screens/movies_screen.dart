import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movie_event.dart';
import 'package:movie_app/movies/presentation/widgets/now_playing_widget.dart';
import 'package:movie_app/movies/presentation/widgets/popular_widget.dart';
import 'package:movie_app/movies/presentation/widgets/top_rated_widget.dart';

import '../../../core/route/route_screen.dart';
import '../../../core/servicrs/service_locater.dart';

class MainMoviesScreen extends StatelessWidget {
  const MainMoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SingleChildScrollView(
          key: const Key('movieScrollView'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NowPlayingWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO POPULAR SCREEN
                        Navigator.pushNamed(context, Routes.popularSeeMore);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text('See More',style: TextStyle(color: Colors.white),),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const PopularWidget(),
              Container(
                margin: const EdgeInsets.fromLTRB(
                  16.0,
                  24.0,
                  16.0,
                  8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Top Rated",
                      style: GoogleFonts.poppins(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: 0.15,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        /// TODO : NAVIGATION TO Top Rated Movies Screen
                        Navigator.pushNamed(context, Routes.topRateSeeMore);

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: const [
                            Text('See More'),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const TopRatedWidget(),
              const SizedBox(height: 50.0),
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, Routes.tvScreen);
              },
                  child: const Text('Tv Screen')),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      )
    ;
  }
}
