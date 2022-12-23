part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class GetTvOnTheAirEvent extends TvEvent {}
class GetTvPopularEvent extends TvEvent {}
class GetTvTopRateEvent extends TvEvent {}
