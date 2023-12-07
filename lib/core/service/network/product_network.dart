import 'package:movie_search_and_detail/constants/enum/enum_url.dart';
import 'package:movie_search_and_detail/core/model/movie_model/movie_model.dart';
import 'package:movie_search_and_detail/utility/static_classes/headers_keys.dart';
import 'package:vexana/vexana.dart';

/// ProductNetwork class for network operations
class ProductNetwork extends NetworkManager<MovieModel> {
  /// ProductNetwork constructor and necessary options
  ProductNetwork()
      : super(
          options: BaseOptions(
            baseUrl: BaseUrl.baseURL.value,
            headers: {
              'X-RapidAPI-Key': HeadersKeys.apiKey,
              'X-RapidAPI-Host': HeadersKeys.hostKey,
            },
          ),
        );
}
