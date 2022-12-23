part of 'tv_details_bloc.dart';

 class TvDetailsState extends Equatable {
   final RequestState tvDetailsState;
   final RequestState recommendedDetailsState;
   final TvDetails? tvDetails;
   final List<TvRecommended> tvDetailsRecommended;
   final String tvDetailsMessage;
   final String tvDetailsRecommendedMessage;


   TvDetailsState(
      {
        this.tvDetailsState=RequestState.loading,
      this.recommendedDetailsState=RequestState.loading,
      this.tvDetails,
      this.tvDetailsRecommended = const [],
      this.tvDetailsMessage ='',
      this.tvDetailsRecommendedMessage =''
      });
   TvDetailsState copyWith({
      RequestState? tvDetailsState,
      RequestState? recommendedDetailsState,
      TvDetails? tvDetails,
      List<TvRecommended>? tvDetailsRecommended,
      String? tvDetailsMessage,
      String? tvDetailsRecommendedMessage,
 }){
     return TvDetailsState(
         tvDetails: tvDetails?? this.tvDetails,
       recommendedDetailsState: recommendedDetailsState??this.recommendedDetailsState,
       tvDetailsMessage: tvDetailsMessage??this.tvDetailsMessage,
       tvDetailsRecommended: tvDetailsRecommended??this.tvDetailsRecommended,
       tvDetailsRecommendedMessage: tvDetailsRecommendedMessage??this.tvDetailsRecommendedMessage,
       tvDetailsState: tvDetailsState ??this.tvDetailsState
     );
   }

  @override
   List<Object?> get props => [
    tvDetailsState,
    recommendedDetailsState,
    tvDetails,
    tvDetailsRecommended,
    tvDetailsMessage,
    tvDetailsRecommendedMessage
  ];
}

