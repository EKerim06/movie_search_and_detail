part of 'detailpage_cubit.dart';

///Detail Page State.
class DetailPageState extends Equatable {
  ///Detail Page State constructor.
  const DetailPageState({
    this.isFavorites = false,
    this.isPageLoading = false,
    this.detailingMovie,
  });

  ///Page is loading control value
  final bool isPageLoading;

  ///fetching movie detail
  final MovieDetailModel? detailingMovie;

  ///selected movie is it favorite default value [isFavorites = false]
  final bool isFavorites;

  @override
  List<Object?> get props => [
        detailingMovie,
        isPageLoading,
        isFavorites,
      ];

  ///veriable is copyWith methot
  DetailPageState copyWith({
    bool? isPageLoading,
    MovieDetailModel? detailingMovie,
    bool? isFavorites,
  }) {
    return DetailPageState(
      isPageLoading: isPageLoading ?? this.isPageLoading,
      detailingMovie: detailingMovie ?? this.detailingMovie,
      isFavorites: isFavorites ?? this.isFavorites,
    );
  }
}
