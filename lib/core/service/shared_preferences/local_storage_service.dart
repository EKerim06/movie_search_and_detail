import 'package:movie_search_and_detail/constants/enum/local_storage_service_keys.dart';
import 'package:movie_search_and_detail/core/service/shared_preferences/local_storage_manager.dart';

///Local Stroge Service class
class LocalStorageService extends LocalStorageManager {
  ///LocalStorage Service constructor
  LocalStorageService({required super.sharedPreferences});

  @override
  Future<void> deleteSelectedMovieId({required String imdbId}) async {
    if (imdbId.isNotEmpty) {
      final readData = sharedPreferences.getStringList(
        LocalStorageServiceKeys.moviesId.name,
      );
      readData?.removeWhere((element) => element == imdbId);
      await sharedPreferences.setStringList(
        LocalStorageServiceKeys.moviesId.name,
        readData ?? [],
      );
    }
  }

  @override
  Future<bool> removeAllMovieId() async {
    return sharedPreferences.clear();
  }

  @override
  List<String>? fetchAllMovieId() {
    final readData = sharedPreferences.getStringList(
      LocalStorageServiceKeys.moviesId.name,
    );
    if (readData?.isEmpty ?? true) return null;
    return readData;
  }

  @override
  Future<void> saveIsMovieId({required String imdbId}) async {
    final readData = sharedPreferences.getStringList(
      LocalStorageServiceKeys.moviesId.name,
    );
    readData?.add(imdbId);
    await sharedPreferences.setStringList(
      LocalStorageServiceKeys.moviesId.name,
      readData ?? <String>[imdbId],
    );
  }
}
