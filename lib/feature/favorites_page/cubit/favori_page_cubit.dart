import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';
import 'package:movie_search_and_detail/core/service/hive/hive_manager.dart';

part 'favori_page_state.dart';

///FavoritePage Cubit
class FavoriPageCubit extends Cubit<FavoriPageState> {
  ///FavoritePage Cubit Constructor
  FavoriPageCubit(this.hiveManager) : super(const FavoriPageState()) {
    fetchHiveData();
  }

  ///logic manager variable
  late final HiveManager hiveManager;

  ///hive registered data is fetching
  void fetchHiveData() {
    final lists = hiveManager.getAllMovie();

    emit(state.copyWith(savesItems: lists));
  }
}
