import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/model/movie_model/movie_model.dart';
import '../../../core/service/network/service_interface.dart';

part 'home_state.dart';

///HomeCubit class for state management is business logic component
class HomeCubit extends Cubit<HomeState> {
  /// HomeCubit constructor

  HomeCubit(this.networkManager) : super(const HomeState()) {
    fetchMovi();
  }

  /// This is for network manager
  late final ServiceInterface networkManager;

  ///fetching to wanted movie from api
  Future<void> fetchMovi({String? movieName}) async {
    _loadChange();
    final response = await networkManager.fetchMovieLists(
      movieName: movieName ?? 'blacklist',
    );
    if (response != null) {
      print(response);
      emit(state.copyWith(movieModel: response));
    }
    _loadChange();
  }

  void _loadChange() {
    emit(state.copyWith(pageIsLoading: !state.pageIsLoading));
  }

  /// This is for search button control value.
  void changeSearch() {
    emit(state.copyWith(isSearchCliked: !state.isSearchCliked));
  }
}
