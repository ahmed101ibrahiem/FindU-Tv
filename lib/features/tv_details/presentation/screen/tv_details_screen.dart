
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/share/widget/erroeWidget.dart';
import 'package:movie_app/core/share/widget/loading_widget.dart';
import 'package:movie_app/core/utils/api_tv_constant.dart';
import 'package:movie_app/core/utils/app_constant.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/media_quary.dart';
import 'package:movie_app/features/tv_details/presentation/controller/tv_details_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/servicrs/service_locater.dart';
import '../../../movie_details/domain/entities/movie_detail_genres.dart';
import '../../domain/entities/tv_details_genres.dart';

class TvDetailsScreen extends StatelessWidget {
   final int id;
   TvDetailsScreen({Key? key,required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => sl<TvDetailsBloc>()..add(GetTvDetailsEvent(id: id))..add(GetRecommendTvEvent(id: id)),
    child: Scaffold(
      body: TvDetailsContent(),
    ),
    );
  }
}

class TvDetailsContent extends StatelessWidget {
  const TvDetailsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TvDetailsBloc,TvDetailsState>(
      buildWhen: (previous, current) => previous.tvDetailsState != current.tvDetailsState,
      builder: (context, state) {
      switch(state.tvDetailsState){
        case RequestState.loaded:
          return CustomScrollView(
            key: const Key('Tv Details Scroll View'),
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: context.height * 0.35,
                flexibleSpace: FlexibleSpaceBar(
                  background:  FadeIn(
                    duration: const Duration(milliseconds: 500),
                    child: ShaderMask(
                      shaderCallback: (rect){
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                              Colors.black,
                              Colors.transparent,
                            ],
                          stops: [0.0, 0.5, 1.0, 1.0],
                        ).createShader(Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
                        );
                      },
                      blendMode: BlendMode.dstIn,
                      child: CachedNetworkImage(
                        width: context.weight,
                        imageUrl: AppString.imageUrl(state.tvDetails!.posterPath),fit:BoxFit.cover,),
                    ),

                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: FadeInUp(
                  from: 20,
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.tvDetails!.name,
                            style: GoogleFonts.poppins(
                              fontSize: 23,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2,
                            )),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2.0,
                                horizontal: 8.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                state.tvDetails!.date.split('-')[0],
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 20.0,
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  (state.tvDetails!.voteAverage )
                                      .toStringAsFixed(2),
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(width: 4.0),
                                Text(
                                  '(${state.tvDetails!.voteAverage})',
                                  style: const TextStyle(
                                    fontSize: 1.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16.0),
                            Text(
                              '${state.tvDetails!.numberOfSeasons} season',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2,
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          state.tvDetails!.overview,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),
                        ),

                        const SizedBox(height: 8.0),
                        Text(
                          'Genres: ${_showGenres(
                              state.tvDetails!.genres)}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                sliver: SliverToBoxAdapter(
                  child: FadeInUp(
                    from: 20,
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      'More like this'.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),

              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 24.0),
                sliver: _showRecommendations(),
              ),

            ],
          );

        case RequestState.loading:
          return const CustomLoadingWidget();

        case RequestState.error:
          return CustomErrorWidget(message: state.tvDetailsMessage);
      }
    },);
  }
  String _showGenres(List<TvGenres> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }


  Widget _showRecommendations() {
    return BlocBuilder<TvDetailsBloc, TvDetailsState>(
      builder: (context, state) {
        switch(state.recommendedDetailsState){
          case RequestState.loading:
            return Center(
              child: CircularProgressIndicator(color: Colors.red,),);
          case RequestState.loaded:
            return SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final recommendation = state.tvDetailsRecommended[index];
                  return FadeInUp(
                    from: 100,
                    duration: const Duration(milliseconds: 500),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                      child: CachedNetworkImage(
                        imageUrl: AppString.imageUrl(recommendation.backdropPath!),
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
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        height: 180.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                childCount: state.tvDetailsRecommended.length
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 0.7,
                crossAxisCount: 3,
              ),
            );
          case RequestState.error:
            return SizedBox(
                child: Center(child: Text('${state.tvDetailsRecommendedMessage}')));

        }

      },
    );
  }

  // Widget _tvRecommendation() {
  //   return BlocBuilder<TvDetailsBloc,TvDetailsState>(
  //     buildWhen: (previous, current) => previous.recommendedDetailsState != current.recommendedDetailsState,
  //     builder: (context, state) {
  //     switch(state.recommendedDetailsState){
  //       case RequestState.loaded:
  //       return SliverGrid(
  //         delegate: SliverChildBuilderDelegate(
  //
  //               (context, index) {
  //             final recommendation = state.tvDetailsRecommended[index];
  //             return FadeInUp(
  //               from: 100,
  //               duration: const Duration(milliseconds: 500),
  //               child: ClipRRect(
  //                 borderRadius: const BorderRadius.all(Radius.circular(4.0)),
  //                 child: CachedNetworkImage(
  //                   imageUrl: AppString.imageUrl(recommendation.backdropPath),
  //                   placeholder: (context, url) => Shimmer.fromColors(
  //                     baseColor: Colors.grey[850]!,
  //                     highlightColor: Colors.grey[800]!,
  //                     child: Container(
  //                       height: 170.0,
  //                       width: 120.0,
  //                       decoration: BoxDecoration(
  //                         color: Colors.black,
  //                         borderRadius: BorderRadius.circular(8.0),
  //                       ),
  //                     ),
  //                   ),
  //                   errorWidget: (context, url, error) => const Icon(Icons.error),
  //                   height: 180.0,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             );
  //           },
  //           childCount: state.tvDetailsRecommended.length,
  //         ),
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //           mainAxisSpacing: 8.0,
  //           crossAxisSpacing: 8.0,
  //           childAspectRatio: 0.7,
  //           crossAxisCount: 3,
  //         ),
  //       );
  //       case RequestState.loading:
  //         return const CustomLoadingWidget();
  //       case RequestState.error:
  //         return CustomErrorWidget(message: state.tvDetailsRecommendedMessage);
  //     }
  //   },);
  // }

}

