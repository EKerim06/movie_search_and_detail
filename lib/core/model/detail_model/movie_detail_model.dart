// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailModel extends INetworkModel<MovieDetailModel> with EquatableMixin {
  MovieDetailModel({
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.poster,
    this.ratings,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.dvd,
    this.boxOffice,
    this.production,
    this.website,
    this.response,
  });
  String? title;
  String? year;
  String? rated;
  String? released;
  String? runtime;
  String? genre;
  String? director;
  String? writer;
  String? actors;
  String? plot;
  String? language;
  String? country;
  String? awards;
  String? poster;
  List<Ratings>? ratings;
  String? metascore;
  String? imdbRating;
  String? imdbVotes;
  String? imdbID;
  String? type;
  String? dvd;
  String? boxOffice;
  String? production;
  String? website;
  String? response;

  @override
  MovieDetailModel fromJson(Map<String, dynamic> json) => _$MovieDetailModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);

  @override
  List<Object?> get props => [
        title,
        year,
        rated,
        released,
        runtime,
        genre,
        director,
        writer,
        actors,
        plot,
        language,
        country,
        awards,
        poster,
        ratings,
        metascore,
        imdbRating,
        imdbVotes,
        imdbID,
        type,
        dvd,
        boxOffice,
        production,
        website,
        response,
      ];

  MovieDetailModel copyWith({
    String? title,
    String? year,
    String? rated,
    String? released,
    String? runtime,
    String? genre,
    String? director,
    String? writer,
    String? actors,
    String? plot,
    String? language,
    String? country,
    String? awards,
    String? poster,
    List<Ratings>? ratings,
    String? metascore,
    String? imdbRating,
    String? imdbVotes,
    String? imdbID,
    String? type,
    String? dvd,
    String? boxOffice,
    String? production,
    String? website,
    String? response,
  }) {
    return MovieDetailModel(
      title: title ?? this.title,
      year: year ?? this.year,
      rated: rated ?? this.rated,
      released: released ?? this.released,
      runtime: runtime ?? this.runtime,
      genre: genre ?? this.genre,
      director: director ?? this.director,
      writer: writer ?? this.writer,
      actors: actors ?? this.actors,
      plot: plot ?? this.plot,
      language: language ?? this.language,
      country: country ?? this.country,
      awards: awards ?? this.awards,
      poster: poster ?? this.poster,
      ratings: ratings ?? this.ratings,
      metascore: metascore ?? this.metascore,
      imdbRating: imdbRating ?? this.imdbRating,
      imdbVotes: imdbVotes ?? this.imdbVotes,
      imdbID: imdbID ?? this.imdbID,
      type: type ?? this.type,
      dvd: dvd ?? this.dvd,
      boxOffice: boxOffice ?? this.boxOffice,
      production: production ?? this.production,
      website: website ?? this.website,
      response: response ?? this.response,
    );
  }
}

@JsonSerializable()
class Ratings extends INetworkModel<Ratings> with EquatableMixin {
  Ratings({
    this.source,
    this.value,
  });
  factory Ratings.fromJson(Map<String, dynamic> json) {
    return _$RatingsFromJson(json);
  }
  String? source;
  String? value;

  @override
  Map<String, dynamic> toJson() => _$RatingsToJson(this);

  @override
  Ratings fromJson(Map<String, dynamic> json) => _$RatingsFromJson(json);

  @override
  List<Object?> get props => [source, value];

  Ratings copyWith({
    String? source,
    String? value,
  }) {
    return Ratings(
      source: source ?? this.source,
      value: value ?? this.value,
    );
  }
}
