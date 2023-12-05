///Base URL enumaration.
enum BaseUrl {
  ///Base url
  baseURL;
}

///Base url Extension
extension BaseUrlExtension on BaseUrl {
  ///Base url enum selected return url
  String get value {
    switch (this) {
      case BaseUrl.baseURL:
        return 'https://movie-database-alternative.p.rapidapi.com';
    }
  }
}
