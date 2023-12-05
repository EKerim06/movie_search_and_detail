import '../../../constants/enum/local_storage_service_keys.dart';
import '../../../core/service/local_storage/local_storage_manager.dart';

///Local Stroge Service class
class LocalStorageService extends LocalStorageManager {
  ///LocalStorage Service constructor
  LocalStorageService({required super.sharedPreferences});

  @override
  Future<void> deleteSelectedMovie({required String imdbId}) async {
    if (imdbId.isNotEmpty) {
      final readData = sharedPreferences.getStringList(
        LocalStorageServiceKeys.movies.name,
      );
      readData?.removeWhere((element) => element == imdbId);
      await sharedPreferences.setStringList(
        LocalStorageServiceKeys.movies.name,
        readData ?? [],
      );
    }
  }

  @override
  Future<bool> removeAll() async {
    return sharedPreferences.clear();
  }

  @override
  List<String>? fetchAllMovie() {
    final readData = sharedPreferences.getStringList(
      LocalStorageServiceKeys.movies.name,
    );
    if (readData?.isEmpty ?? true) return null;
    return readData;
  }

  @override
  Future<void> saveIsMovie({required String imdbId}) async {
    final readData = sharedPreferences.getStringList(
      LocalStorageServiceKeys.movies.name,
    );
    readData?.add(imdbId);
    await sharedPreferences.setStringList(
      LocalStorageServiceKeys.movies.name,
      readData ?? <String>[imdbId],
    );
  }
}
