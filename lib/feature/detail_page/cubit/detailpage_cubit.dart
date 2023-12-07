// ignore_for_file: omit_local_variable_types, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_search_and_detail/core/model/detail_model/movie_detail_model.dart';
import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';
import 'package:movie_search_and_detail/core/service/hive/hive_manager.dart';
import 'package:movie_search_and_detail/core/service/network/service_interface.dart';
import 'package:movie_search_and_detail/core/service/shared_preferences/local_storage_manager.dart';
import 'package:movie_search_and_detail/core/service/shared_preferences/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'detailpage_state.dart';

///Detail Page Cubit.
class DetailPageCubit extends Cubit<DetailPageState> {
  ///Detail Page Cubit constructor.
  DetailPageCubit(
    this.networkSerice, {
    required String imdbId,
    required this.hiveService,
    required this.selectedMovie,
  }) : super(const DetailPageState()) {
    _init();
    fetchMovieDetail(imdbId: imdbId);
  }

  late final LocalStorageManager _manager;

  ///selectedMovie
  late final Search selectedMovie;

  ///hive cache manager.
  late final HiveManager hiveService;

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
    final readingData = _manager.fetchAllMovieId();

    final isItFavorite = readingData?.contains(model?.imdbID);

    emit(state.copyWith(isFavorites: isItFavorite));
  }

  ///save data
  void saveData({required String imdbId}) {
    _manager.saveIsMovieId(imdbId: imdbId);
    hiveService.saveMovie(movie: selectedMovie);
    emit(state.copyWith(isFavorites: true));
  }

  ///deleting data
  void deleteData({required String imdbId}) {
    _manager.deleteSelectedMovieId(imdbId: imdbId);
    hiveService.removeSelectedMovie(movie: selectedMovie);
    emit(state.copyWith(isFavorites: false));
  }

  ///local storage is wrong variable is save whereas run
  Future<bool> removeAll() async {
    final response = await _manager.removeAllMovieId();
    return response;
  }
}
