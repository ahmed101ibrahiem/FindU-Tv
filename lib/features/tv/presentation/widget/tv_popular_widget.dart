



 import 'package:animate_do/animate_do.dart';
 import 'package:cached_network_image/cached_network_image.dart';
 import 'package:flutter/material.dart';
 import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:flutter_spinkit/flutter_spinkit.dart';
 import 'package:movie_app/core/utils/enums.dart';
 import 'package:movie_app/core/utils/media_quary.dart';
 import 'package:movie_app/features/tv/presentation/controller/tv_bloc.dart';
 import 'package:shimmer/shimmer.dart';
 import '../../../../core/utils/app_constant.dart';

 class TvPopularWidget extends StatelessWidget {
   const TvPopularWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<TvBloc, TvState>(
buildWhen: (previous, current) => previous.popularTvState != current.popularTvState,
    builder: (context, state) {
     switch (state.popularTvState) {
      case RequestState.loaded:
       return FadeIn(
        duration: const Duration(milliseconds: 500),
        child: SizedBox(
         height: context.height * 0.21,
         child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: state.popularTv.length,
          itemBuilder: (context, index) {
           final movie = state.popularTv[index];
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
                 height: context.height * 0.21,
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
       );
      case RequestState.loading:
       return SizedBox(
        height: context.height * 0.21,
        child: const Center(
         child: SpinKitCircle(
          color: Colors.cyan,
         ),
        ),
       );
      case RequestState.error:
       return SizedBox(
        height: context.height * 0.21,
        child: Center(
         child: Text(state.onTheAirTvMessage),
        ),
       );
     }
    },
   );
  }
 }
