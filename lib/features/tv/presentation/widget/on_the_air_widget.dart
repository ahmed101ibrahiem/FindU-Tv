import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/core/utils/app_constant.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/core/utils/media_quary.dart';
import 'package:movie_app/features/tv/presentation/controller/tv_bloc.dart';
import 'package:movie_app/features/tv_details/presentation/screen/tv_details_screen.dart';

class OnTheAirWidget extends StatelessWidget {
  const OnTheAirWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvBloc, TvState>(
      buildWhen: (previous, current) =>
          previous.onTheAirTvState != current.onTheAirTvState,
      builder: (context, state) {
        switch (state.onTheAirTvState) {
          case RequestState.loading:
            return SizedBox(
              height: context.height *0.4,
              child: const Center(
                child: SpinKitCircle(
                  color: Colors.cyan,
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 170,
              child: Center(
                child: Text(state.onTheAirTvMessage),
              ),
            );

          case RequestState.loaded:
            return FadeIn(
                duration: const Duration(microseconds: 500),
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: context.height * 0.40,
                      viewportFraction: 1.0,
                      onPageChanged: (index, reason) {}),
                  items: state.onTheAirTv.map((item) {
                    return GestureDetector(
                      key: Key('on the air widget'),
                      onTap: () {
                        /// todo :Navigate to Details
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TvDetailsScreen(id:item.id)));
                      },
                      child: Stack(
                        children: [
                          ShaderMask(
                            shaderCallback: (rect) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                  Colors.black,
                                  Colors.transparent
                                ],
                                stops:  [0, 0.3, 0.5, 1],
                              ).createShader(
                                  Rect.fromLTRB(0, 0, rect.width, rect.height));
                            },
                            blendMode: BlendMode.dstIn,
                            child: CachedNetworkImage(
                                height: 560.0,
                                imageUrl: AppString.imageUrl(item.backdropPath),
                                fit: BoxFit.cover),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.redAccent,
                                        size: 16.0,
                                      ),
                                      const SizedBox(width: 4.0),
                                      Text(
                                        'on the air'.toUpperCase(),
                                        style: const TextStyle(
                                            fontSize: 16.0,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Text(
                                    item.title,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  }).toList(),
                ));
        }
      },
    );
  }
}
