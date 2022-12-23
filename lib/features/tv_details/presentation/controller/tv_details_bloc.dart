import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';

import '../../../movie_details/domain/usecase/get_movie_detaild_usecase.dart';
import '../../domain/entities/tv_details.dart';
import '../../domain/entities/tv_details_recommend.dart';
import '../../domain/usecase/get_recommend_tv_usecase.dart';
import '../../domain/usecase/get_tv_details_usecase.dart';

part 'tv_details_event.dart';
part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  final GetTvRecommendUseCase getTvRecommendUseCase;
  final GetTvDetailsUseCase getTvDetailsUseCase;
  TvDetailsBloc({required this.getTvRecommendUseCase,required this.getTvDetailsUseCase}) : super(TvDetailsState()) {
    on<GetRecommendTvEvent>(_recommendTvEvent);
    on<GetTvDetailsEvent>(_tvDetailsEvent);

  }

  FutureOr<void> _recommendTvEvent(GetRecommendTvEvent event, Emitter<TvDetailsState> emit)async {
   final result = await getTvRecommendUseCase(MovieDetailParams(id:  event.id));
   result.fold((l) => emit(state.copyWith(
     tvDetailsRecommendedMessage: l.message,
     recommendedDetailsState: RequestState.error
   )),
           (r) => emit(state.copyWith(
             recommendedDetailsState: RequestState.loaded,
             tvDetailsRecommended: r
           )));
  }

  FutureOr<void> _tvDetailsEvent(GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async{
    final result = await getTvDetailsUseCase(MovieDetailParams(id: event.id));
    result.fold((l) => emit(state.copyWith(
        tvDetailsMessage: l.message,
        tvDetailsState: RequestState.error
    )),
            (r) => emit(state.copyWith(
            tvDetailsState: RequestState.loaded,
            tvDetails: r
        )));
  }
}
