

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/features/tv/presentation/widget/on_the_air_widget.dart';

import '../../../../core/route/route_screen.dart';
import '../widget/tv_popular_widget.dart';
import '../widget/tv_top_rated_widget.dart';



class TvScreen extends StatelessWidget {
  const TvScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OnTheAirWidget(),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 16.0),
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
                      Navigator.pushNamed(context, Routes.tvPopularSeeMore);
                    },
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
                ],
              ),
            ),
            TvPopularWidget(),
            Container(
              margin: const EdgeInsets.fromLTRB(
                16.0,
                24.0,
                16.0,
                16.0,
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
                      Navigator.pushNamed(context, Routes.tvTopRateSeeMore);

                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
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
            TvTopRatedWidget(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
