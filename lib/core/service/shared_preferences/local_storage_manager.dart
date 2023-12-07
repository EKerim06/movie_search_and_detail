import 'package:shared_preferences/shared_preferences.dart';

///LocalStorageService Abstract class
abstract class LocalStorageManager {
  ///LocalStroggeService is constructor
  LocalStorageManager({required this.sharedPreferences});

  ///Using in SharedPreferences instance
  late final SharedPreferences sharedPreferences;

  ///saving to selected movie
  Future<void> saveIsMovieId({required String imdbId});

  ///get to local storage fetch all movie
  List<String>? fetchAllMovieId();

  ///selected movie delete in local Storage
  Future<void> deleteSelectedMovieId({required String imdbId});

  ///Removing all local storage items.
  Future<bool> removeAllMovieId();
}
