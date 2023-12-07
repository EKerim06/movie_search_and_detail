import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_search_and_detail/constants/enum/local_storage_service_keys.dart';
import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';
import 'package:movie_search_and_detail/core/service/hive/hive_manager.dart';

///Hive Service
class HiveService extends HiveManager {
  ///
  HiveService() {
    init();
  }

  ///
  Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<Search>(LocalStorageServiceKeys.movie.name);
  }

  @override
  List<Search> getAllMovie() {
    final box = Hive.box<Search>(LocalStorageServiceKeys.movie.name);

    final response = box.values.toList();

    Hive.close();
    return response;
  }

  @override
  Future<void> removeSelectedMovie({required Search movie}) async {
    final box = Hive.box<Search>(LocalStorageServiceKeys.movie.name);

    final lists = box.values.toList();

    final dummyList = <Search>[];

    for (final element in lists) {
      if (element != movie) {
        dummyList.add(element);
      }
    }
    await box.clear();
    await box.addAll(dummyList);
  }

  @override
  Future<void> saveMovie({required Search movie}) async {
    final box = Hive.box<Search>(LocalStorageServiceKeys.movie.name);

    await box.add(movie);
  }
}
