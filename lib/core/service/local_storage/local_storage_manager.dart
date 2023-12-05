import 'package:shared_preferences/shared_preferences.dart';

///LocalStorageService Abstract class
abstract class LocalStorageManager {
  ///LocalStroggeService is constructor
  LocalStorageManager({required this.sharedPreferences});

  ///Using in SharedPreferences instance
  late final SharedPreferences sharedPreferences;

  ///saving to selected movie
  Future<void> saveIsMovie({required String imdbId});

  ///get to local storage fetch all movie
  List<String>? fetchAllMovie();

  ///selected movie delete in local Storage
  Future<void> deleteSelectedMovie({required String imdbId});


  ///Removing all local storage items.
  Future<bool> removeAll();
}
