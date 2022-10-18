
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controller/movie_state.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/utils/app_constant.dart';
import '../../../core/utils/dummy.dart';
class PopularWidget extends StatelessWidget {
  const PopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc,MovieState>(
      builder: (BuildContext context, state) { return FadeIn(
        duration: const Duration(milliseconds: 500),
        child: SizedBox(
          height: 170.0,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              final movie = moviesList[index];
              return Container(
                padding: const EdgeInsets.only(right: 8.0),
                child: InkWell(
                  onTap: () {
                    /// TODO : NAVIGATE TO  MOVIE DETAILS
                  },
                  child: ClipRRect(
                    borderRadius:
                    const BorderRadius.all(Radius.circular(8.0)),
                    child: CachedNetworkImage(
                      width: 120.0,
                      fit: BoxFit.cover,
                      imageUrl: AppString.imageUrl(movie.backdropPath),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 170.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ); },

    );
  }
}
