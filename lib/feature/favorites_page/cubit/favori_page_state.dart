part of 'favori_page_cubit.dart';

///FavoritePage State
class FavoriPageState extends Equatable {
  ///FavoritePage State constructor
  const FavoriPageState({this.savesItems});

  ///Hive local storage registered data.
  final List<Search?>? savesItems;

  @override
  List<Object?> get props => [savesItems];

  ///Favorite Page State copyWith methot.
  FavoriPageState copyWith({
    List<Search?>? savesItems,
  }) {
    return FavoriPageState(
      savesItems: savesItems ?? this.savesItems,
    );
  }
}
