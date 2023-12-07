import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';

///Hive abstract class
abstract class HiveManager {
  ///Save as a movie
  Future<void> saveMovie({required Search movie});

  ///get hive storage all movie
  List<Search> getAllMovie();

  ///selecting movie is deleting
  Future<void> removeSelectedMovie({required Search movie});
}
