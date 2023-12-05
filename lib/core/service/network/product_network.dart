import 'package:vexana/vexana.dart';

import '../../../constants/enum/enum_headers_keys.dart';
import '../../../constants/enum/enum_url.dart';
import '../../model/movie_model/movie_model.dart';

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
