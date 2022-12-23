import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/custom_list_widget.dart';
import '../../../core/share/widget/erroeWidget.dart';
import '../../../core/share/widget/loading_widget.dart';
import '../../../core/utils/enums.dart';
import '../controller/movie_bloc.dart';
import '../controller/movie_state.dart';

class MoviePopularLis extends StatelessWidget {
  const MoviePopularLis({Key? key, required this.enyMovieList})
      : super(key: key);
  final bool enyMovieList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E29),
      appBar: AppBar(
        title: Text(enyMovieList ? 'Populars Movies' : 'TopRatedMovie'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: enyMovieList ? _popularMovieList() : _topRatedMovieList(),
    );
  }

  BlocBuilder<MovieBloc, MovieState> _popularMovieList() {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.popularState != current.popularState,
      builder: (BuildContext context, state) {
        switch (state.popularState) {
          case RequestState.loaded:
            return CustomListWidget(
              movieList: state.popularMovie,
            );
          case RequestState.loading:
            return const CustomLoadingWidget();
          case RequestState.error:
            return CustomErrorWidget(
              message: state.popularMessage,
            );
        }
      },
    );
  }

  BlocBuilder<MovieBloc, MovieState> _topRatedMovieList() {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestState.loading:
            return const CustomLoadingWidget();
          case RequestState.error:
            return CustomErrorWidget(message: state.topRatedMessage);
          case RequestState.loaded:
            return CustomListWidget(
              movieList: state.topRatedMovie,
            );
        }
      },
    );
  }
}
