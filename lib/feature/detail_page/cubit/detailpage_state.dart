// ignore_for_file: lines_longer_than_80_chars

part of 'detailpage_cubit.dart';

///Detail Page State.
class DetailPageState extends Equatable {
  ///Detail Page State constructor.
  const DetailPageState({
    this.isFavorites = false,
    this.isPageLoading = false,
    this.detailingMovie,
    this.selectedMoviePurshare,
  });

  ///Page is loading control value
  final bool isPageLoading;

  ///fetching movie detail
  final MovieDetailModel? detailingMovie;

  ///selected movie is it favorite default value [isFavorites = false]
  final bool isFavorites;

  ///is selected movie purshare links.
  final PurshareModel? selectedMoviePurshare;

  @override
  List<Object?> get props => [
        detailingMovie,
        isPageLoading,
        isFavorites,
        selectedMoviePurshare,
      ];

  ///veriable is copyWith methot
  DetailPageState copyWith({
    MovieDetailModel? detailingMovie,
    PurshareModel? selectedMoviePurshare,
    bool? isPageLoading,
    bool? isFavorites,
  }) {
    return DetailPageState(
      isPageLoading: isPageLoading ?? this.isPageLoading,
      detailingMovie: detailingMovie ?? this.detailingMovie,
      isFavorites: isFavorites ?? this.isFavorites,
      selectedMoviePurshare: selectedMoviePurshare ?? this.selectedMoviePurshare,
    );
  }
}
