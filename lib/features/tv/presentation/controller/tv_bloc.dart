import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/core/utils/enums.dart';

import '../../domain/entities/tv.dart';
import '../../domain/usecase/get_tv_on_the_air_usecase.dart';
import '../../domain/usecase/get_tv_popular_usecase.dart';
import '../../domain/usecase/get_tv_top_rated_usecase.dart';
part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
 final  GetTvOnTheAirUseCase getTvOnTheAirUseCase;
 final  GetTvPopularUseCase getTvPopularUseCase;
  final GetTvTopRatedUseCase getTvTopRatedUseCase;
  TvBloc({required this.getTvOnTheAirUseCase,required this.getTvTopRatedUseCase,required this.getTvPopularUseCase}) : super(TvState()) {
    on<GetTvOnTheAirEvent>(_onTheAitTv);
    on<GetTvPopularEvent>(_popularTv);
    on<GetTvTopRateEvent>(_topRatedTv);
  }

  FutureOr<void> _onTheAitTv(GetTvOnTheAirEvent event, Emitter<TvState> emit)async {
    final result = await getTvOnTheAirUseCase(NoParams());
    result.fold((l) => emit(state.copyWith(
      onTheAirTvState: RequestState.error,
      onTheAirTvMessage: l.message
    )),
            (r) => emit(state.copyWith(
              onTheAirTvState: RequestState.loaded,
              onTheAirTv: r
            )));
  }

  FutureOr<void> _popularTv(GetTvPopularEvent event, Emitter<TvState> emit) async{
    final result = await getTvPopularUseCase(NoParams());
    result.fold((l) => emit(state.copyWith(
        popularTvState: RequestState.error,
        popularTvMessage: l.message
    )),
            (r) => emit(state.copyWith(
            popularTvState: RequestState.loaded,
            popularTv: r
        )));
  }

  FutureOr<void> _topRatedTv(GetTvTopRateEvent event, Emitter<TvState> emit) async{
    final result = await getTvTopRatedUseCase(NoParams());
    result.fold((l) => emit(state.copyWith(
        topRatedTvTvState: RequestState.error,
        topRatedTvTvMessage: l.message
    )),
            (r) => emit(state.copyWith(
            topRatedTvTvState: RequestState.loaded,
            topRatedTv: r
        )));
  }
}
