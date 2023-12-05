// ignore_for_file: public_member_api_docs

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends INetworkModel<MovieModel> with EquatableMixin {
  List<Search>? search;
  String? totalResults;
  String? response;

  MovieModel({
    this.search,
    this.totalResults,
    this.response,
  });


  @override
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  List<Object?> get props => [search, totalResults, response];

  MovieModel copyWith({
    List<Search>? search,
    String? totalResults,
    String? response,
  }) {
    return MovieModel(
      search: search ?? this.search,
      totalResults: totalResults ?? this.totalResults,
      response: response ?? this.response,
    );
  }

  @override
  MovieModel fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }
}

@JsonSerializable()
class Search with EquatableMixin {
  String? title;
  String? year;
  String? imdbID;
  String? type;
  String? poster;

  Search({
    this.title,
    this.year,
    this.imdbID,
    this.type,
    this.poster,
  });

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);

  @override
  List<Object?> get props => [title, year, imdbID, type, poster];

  Search copyWith({
    String? title,
    String? year,
    String? imdbID,
    String? type,
    String? poster,
  }) {
    return Search(
      title: title ?? this.title,
      year: year ?? this.year,
      imdbID: imdbID ?? this.imdbID,
      type: type ?? this.type,
      poster: poster ?? this.poster,
    );
  }
}
