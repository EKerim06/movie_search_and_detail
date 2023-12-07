// ignore_for_file: lines_longer_than_80_chars

import 'package:movie_search_and_detail/core/model/detail_model/movie_detail_model.dart';
import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';
import 'package:movie_search_and_detail/core/service/network/service_interface.dart';
import 'package:vexana/vexana.dart';

/// NetworkService class for network operations
class NetworkService extends ServiceInterface {
  /// NetworkService constructor and necessary options
  NetworkService(super.networkManager);

  @override
  Future<MovieModel?> fetchMovieLists({required String movieName}) async {
    final response = await networkManager.send<MovieModel, MovieModel>(
      '/?s=$movieName&r=json&page=1',
      parseModel: MovieModel(),
      isErrorDialog: true,
      method: RequestType.GET,
    );

    return response.data;
  }

  @override
  Future<MovieDetailModel?> fetchMovieDetail({required String imdbId}) async {
    final response = await networkManager.send<MovieDetailModel, MovieDetailModel>(
      '/?r=json&i=$imdbId',
      parseModel: MovieDetailModel(),
      isErrorDialog: true,
      method: RequestType.GET,
    );
    return response.data;
  }
}
