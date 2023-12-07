import 'package:movie_search_and_detail/core/model/detail_model/movie_detail_model.dart';
import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';
import 'package:vexana/vexana.dart';

/// ServiceInterface class for network operations abstract layer
abstract class ServiceInterface {
  /// Constructor
  ServiceInterface(this.networkManager);

  /// ServiceInterface constructor and necessary options
  late final NetworkManager networkManager;

  ///fetching movie func layer
  Future<MovieModel?> fetchMovieLists({required String movieName});

  // Future<List<MovieModel>?> fetchHttprequest();

  ///fetching movie detail function.
  Future<MovieDetailModel?> fetchMovieDetail({required String imdbId});
}
