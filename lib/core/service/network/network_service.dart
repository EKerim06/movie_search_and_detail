import 'package:vexana/vexana.dart';

import '../../../core/model/detail_model/movie_detail_model.dart';
import '../../../core/model/movie_model/movie_model.dart';
import '../../../core/service/network/service_interface.dart';

/// NetworkService class for network operations
class NetworkService extends ServiceInterface {
  /// NetworkService constructor and necessary options
  NetworkService(NetworkManager networkManager) : super(networkManager);

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
