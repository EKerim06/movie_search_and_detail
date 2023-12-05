import 'package:flutter_test/flutter_test.dart';
import 'package:movie_search_and_detail/core/service/network/network_service.dart';
import 'package:movie_search_and_detail/core/service/network/product_network.dart';
import 'package:movie_search_and_detail/core/service/network/service_interface.dart';

void main() {
  late final ServiceInterface networkManager;
  setUp(() {
    networkManager = NetworkService(ProductNetwork());
  });

  test('fetching movie list', () async {
    final response = await networkManager.fetchMovieLists(movieName: 'Blacklist');
    expect(response, isNotNull);
  });

  test('Fetch Selected movie detail.', () async {
    final response = await networkManager.fetchMovieDetail(imdbId: 'tt4154796');
    expect(response, isNotNull);
  });
}
