import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/core/utils/media_quary.dart';
import 'package:movie_app/features/tv/domain/entities/tv.dart';
import 'package:movie_app/features/tv/presentation/controller/tv_bloc.dart';
import 'package:movie_app/features/tv_details/domain/entities/tv_details_genres.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../movies/presentation/widgets/custom_list_widget.dart';
import '../../../../core/share/widget/erroeWidget.dart';
import '../../../../core/share/widget/loading_widget.dart';
import '../../../../core/utils/app_constant.dart';
import '../../../../core/utils/enums.dart';
import '../widget/tv_list_widget.dart';

class TvListScreen extends StatelessWidget {
  final bool enyMovieList;

  TvListScreen({Key? key, required this.enyMovieList})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1E1E29),
        appBar: AppBar(
          title: Text(enyMovieList ? 'Populars Tvs' : 'Top Rated Tvs'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body:enyMovieList? _tvPopularList():_tvTopRatedList()
    );
  }

  BlocBuilder<TvBloc, TvState> _tvPopularList() {
    return BlocBuilder<TvBloc, TvState>(
        buildWhen: (previous, current) =>
        previous.popularTvState != current.popularTvState,
        builder: (context, state) {
          switch (state.popularTvState) {
            case RequestState.loaded:
              return CustomeLoadedTvList(tvList: state.popularTv,);
            case RequestState.loading:
              return CustomLoadingWidget();
            case RequestState.error:
              return CustomErrorWidget(message: state.popularTvMessage);
          }
        },
      );
  }
  BlocBuilder<TvBloc, TvState> _tvTopRatedList() {
    return BlocBuilder<TvBloc, TvState>(
        buildWhen: (previous, current) =>
        previous.topRatedTvTvState != current.topRatedTvTvState,
        builder: (context, state) {
          switch (state.topRatedTvTvState) {
            case RequestState.loaded:
              return CustomeLoadedTvList(tvList: state.topRatedTv,);
            case RequestState.loading:
              return const CustomLoadingWidget();
            case RequestState.error:
              return CustomErrorWidget(message: state.topRatedTvTvMessage);
          }
        },
      );
  }
}

