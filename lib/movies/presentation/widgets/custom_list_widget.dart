import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/media_quary.dart';
import 'package:shimmer/shimmer.dart';

import '../../../features/movie_details/presentation/screens/movie_detail_screen.dart';
import '../../../core/utils/app_constant.dart';



class CustomListWidget extends StatelessWidget {
  final List movieList;
   CustomListWidget({
     required this.movieList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
        duration: Duration(microseconds: 5000),
        child: SizedBox(
          child: ListView.builder(
            itemCount: movieList.length,
            padding:
            EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            itemBuilder: (context, index) {
              final movie = movieList[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailScreen(id: movie.id),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 6.0),
                  child: Container(
                    width: double.infinity,
                    height: context.height * 0.22,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: const Color(0xFF303030),
                        borderRadius: BorderRadius.circular(16.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(16.0)),
                          child: CachedNetworkImage(
                            height: context.height * 0.20,
                            width: context.weight * 0.26,
                            fit: BoxFit.cover,
                            imageUrl:
                            AppString.imageUrl(movie.backdropPath),
                            placeholder: (context, url) =>
                                Shimmer.fromColors(
                                  baseColor: Colors.grey[850]!,
                                  highlightColor: Colors.grey[800]!,
                                  child: Container(
                                    height: context.height * 0.21,
                                    width: 120.0,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                      BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 16.0,
                              ),
                              Text(movie.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 1.2,
                                  )),
                              const SizedBox(height: 14.0),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                      horizontal: 8.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red[800],
                                      borderRadius:
                                      BorderRadius.circular(4.0),
                                    ),
                                    child: Text(
                                      movie.releaseDate.split('-')[0],
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                        size: 20.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        (movie.voteAverage)
                                            .toStringAsFixed(2),
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                (movie.overview),
                                maxLines: 2,
                                //  softWrap: true,
                                style: const TextStyle(
                                  height: 1.2,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.2,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
