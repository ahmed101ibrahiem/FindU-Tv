part of 'tv_details_bloc.dart';

abstract class TvDetailsEvent extends Equatable {
  const TvDetailsEvent();
}

class GetRecommendTvEvent extends TvDetailsEvent {
  final int id;

  GetRecommendTvEvent({required this.id});
  @override
  List<Object?> get props => [id];
}
class GetTvDetailsEvent extends TvDetailsEvent {
  final int id;

  GetTvDetailsEvent({required this.id});
  @override
  List<Object> get props => [id];
}
