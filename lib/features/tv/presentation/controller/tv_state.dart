part of 'tv_bloc.dart';

class TvState extends Equatable {
  final List<Tv> onTheAirTv;
  final RequestState onTheAirTvState;
  final String onTheAirTvMessage;
  final List<Tv> popularTv;
  final RequestState popularTvState;
  final String popularTvMessage;
  final List<Tv> topRatedTv;
  final RequestState topRatedTvTvState;
  final String topRatedTvTvMessage;

  TvState(
      {this.onTheAirTv = const [],
      this.onTheAirTvState = RequestState.loading,
      this.onTheAirTvMessage = '',
      this.popularTv = const [],
      this.popularTvState = RequestState.loading,
      this.popularTvMessage = '',
      this.topRatedTv = const [],
      this.topRatedTvTvState = RequestState.loading,
      this.topRatedTvTvMessage = ''});

  TvState copyWith({
    List<Tv>? onTheAirTv,
    RequestState? onTheAirTvState,
    String? onTheAirTvMessage,
    List<Tv>? popularTv,
    RequestState? popularTvState,
    String? popularTvMessage,
    List<Tv>? topRatedTv,
    RequestState? topRatedTvTvState,
    String? topRatedTvTvMessage,
  }) {
    return TvState(
        onTheAirTv: onTheAirTv ?? this.onTheAirTv,
        onTheAirTvState: onTheAirTvState ?? this.onTheAirTvState,
        onTheAirTvMessage: onTheAirTvMessage ?? this.onTheAirTvMessage,
        popularTv: popularTv ?? this.popularTv,
        popularTvState: popularTvState ?? this.popularTvState,
        popularTvMessage: popularTvMessage ?? this.popularTvMessage,
        topRatedTv: topRatedTv ?? this.topRatedTv,
        topRatedTvTvState: topRatedTvTvState ?? this.topRatedTvTvState,
        topRatedTvTvMessage: topRatedTvTvMessage ?? this.topRatedTvTvMessage);
  }

  @override
  List<Object> get props => [
        onTheAirTv,
        onTheAirTvState,
        onTheAirTvMessage,
        popularTv,
        popularTvState,
        popularTvMessage,
        topRatedTv,
        topRatedTvTvState,
        topRatedTvTvMessage
      ];
}
