// ignore_for_file: lines_longer_than_80_chars

import 'package:movie_search_and_detail/core/model/detail_model/movie_detail_model.dart';
import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';
import 'package:movie_search_and_detail/core/model/purshare_model/purshare_model.dart';
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

  @override
  Future<PurshareModel?> selectedMoviePurshareFetch({required String movieName}) async {
    final data = NetworkManager<PurshareModel>(
      options: BaseOptions(
        baseUrl: 'https://utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com',
        headers: {
          'X-RapidAPI-Key': 'a72f4b50f4mshe5b07d2841d1cf4p192f3fjsn2873cf327d12',
          'X-RapidAPI-Host': 'utelly-tv-shows-and-movies-availability-v1.p.rapidapi.com',
        },
      ),
    );
    final response = await data.send<PurshareModel, PurshareModel>(
      '/lookup?term=$movieName&country=uk',
      parseModel: PurshareModel(),
      method: RequestType.GET,
    );
    return response.data;
  }
}
