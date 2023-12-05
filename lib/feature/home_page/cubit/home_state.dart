part of 'home_cubit.dart';

///HomeState class for state management
class HomeState extends Equatable {
  /// HomeState constructor
  const HomeState({
    this.movieModel,
    this.isSearchCliked = false,
    this.pageIsLoading = false,
  });

  /// This is for movie model
  final MovieModel? movieModel;

  /// This is for loading indicator control value.
  /// default value is [pageIsLoading = false]
  final bool pageIsLoading;

  /// This is for search button control value.
  final bool isSearchCliked;

  @override
  List<Object?> get props => [
        movieModel,
        pageIsLoading,
        isSearchCliked,
      ];

  /// CopyWith method for state
  HomeState copyWith({
    MovieModel? movieModel,
    bool? pageIsLoading,
    bool? isSearchCliked,
  }) {
    return HomeState(
      isSearchCliked: isSearchCliked ?? this.isSearchCliked,
      movieModel: movieModel ?? this.movieModel,
      pageIsLoading: pageIsLoading ?? this.pageIsLoading,
    );
  }
}
