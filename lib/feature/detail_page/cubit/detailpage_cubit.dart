import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/model/detail_model/movie_detail_model.dart';
import '../../../core/service/local_storage/local_storage_manager.dart';
import '../../../core/service/local_storage/local_storage_service.dart';
import '../../../core/service/network/service_interface.dart';

part 'detailpage_state.dart';

///Detail Page Cubit.
class DetailPageCubit extends Cubit<DetailPageState> {
  ///Detail Page Cubit constructor.
  DetailPageCubit(
    this.networkSerice, {
    required String imdbId,
  }) : super(const DetailPageState()) {
    _init();
    fetchMovieDetail(imdbId: imdbId);
  }

  late final LocalStorageManager _manager;

  Future<void> _init() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _manager = LocalStorageService(sharedPreferences: sharedPreferences);
  }

  ///Detail Page Cubit constructor.
  final ServiceInterface networkSerice;

  ///fetching movie detail.
  Future<void> fetchMovieDetail({required String imdbId}) async {
    _loadChange();
    final response = await networkSerice.fetchMovieDetail(imdbId: imdbId);
    isItFavorite(model: response);
    // await removeAll();
    emit(state.copyWith(detailingMovie: response));
    _loadChange();
  }

  void _loadChange() {
    emit(state.copyWith(isPageLoading: !state.isPageLoading));
  }

  ///local storage saved movie is fetch
  void isItFavorite({MovieDetailModel? model}) {
    final readingData = _manager.fetchAllMovie();

    final isItFavorite = readingData?.contains(model?.imdbID);

    emit(state.copyWith(isFavorites: isItFavorite));
  }

  ///save data
  void saveData({required String imdbId}) {
    _manager.saveIsMovie(imdbId: imdbId);
    emit(state.copyWith(isFavorites: true));
  }

  ///deleting data
  void deleteData({required String imdbId}) {
    _manager.deleteSelectedMovie(imdbId: imdbId);
    emit(state.copyWith(isFavorites: false));
  }

  Future<bool> removeAll() async {
    final response = await _manager.removeAll();
    print(response);
    return response;
  }
}
