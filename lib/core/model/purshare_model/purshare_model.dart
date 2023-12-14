// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'purshare_model.g.dart';

@JsonSerializable()
class PurshareModel extends INetworkModel<PurshareModel> with EquatableMixin {
  String? variant;
  List<Results>? results;
  String? updated;
  String? term;
  int? statusCode;

  PurshareModel({
    this.variant,
    this.results,
    this.updated,
    this.term,
    this.statusCode,
  });

  @override
  PurshareModel fromJson(Map<String, dynamic> json) =>
      PurshareModel.fromJson(json);

  factory PurshareModel.fromJson(Map<String, dynamic> json) =>
      _$PurshareModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$PurshareModelToJson(this);

  @override
  List<Object?> get props => [variant, results, updated, term, statusCode];

  PurshareModel copyWith({
    String? variant,
    List<Results>? results,
    String? updated,
    String? term,
    int? statusCode,
  }) {
    return PurshareModel(
      variant: variant ?? this.variant,
      results: results ?? this.results,
      updated: updated ?? this.updated,
      term: term ?? this.term,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}

@JsonSerializable()
class Results extends INetworkModel<Results> with EquatableMixin {
  List<Locations>? locations;
  int? weight;
  String? id;
  ExternalIds? externalIds;
  String? picture;
  String? provider;
  String? name;

  Results({
    this.locations,
    this.weight,
    this.id,
    this.externalIds,
    this.picture,
    this.provider,
    this.name,
  });

  @override
  Results fromJson(Map<String, dynamic> json) => Results.fromJson(json);

  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ResultsToJson(this);

  @override
  List<Object?> get props =>
      [locations, weight, id, externalIds, picture, provider, name];

  Results copyWith({
    List<Locations>? locations,
    int? weight,
    String? id,
    ExternalIds? externalIds,
    String? picture,
    String? provider,
    String? name,
  }) {
    return Results(
      locations: locations ?? this.locations,
      weight: weight ?? this.weight,
      id: id ?? this.id,
      externalIds: externalIds ?? this.externalIds,
      picture: picture ?? this.picture,
      provider: provider ?? this.provider,
      name: name ?? this.name,
    );
  }
}

@JsonSerializable()
class Locations extends INetworkModel<Locations> with EquatableMixin {
  String? displayName;
  String? id;
  String? url;
  String? name;
  String? icon;

  Locations({
    this.displayName,
    this.id,
    this.url,
    this.name,
    this.icon,
  });

  @override
  Locations fromJson(Map<String, dynamic> json) => Locations.fromJson(json);

  factory Locations.fromJson(Map<String, dynamic> json) =>
      _$LocationsFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$LocationsToJson(this);

  @override
  List<Object?> get props => [displayName, id, url, name, icon];

  Locations copyWith({
    String? displayName,
    String? id,
    String? url,
    String? name,
    String? icon,
  }) {
    return Locations(
      displayName: displayName ?? this.displayName,
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }
}

@JsonSerializable()
class ExternalIds extends INetworkModel<ExternalIds> with EquatableMixin {
  Imdb? imdb;
  Tmdb? tmdb;
  Iva? iva;
  String? facebook;
  String? rottenTomatoes;
  WikiData? wikiData;
  String? ivaRating;
  String? gracenote;

  ExternalIds({
    this.imdb,
    this.tmdb,
    this.iva,
    this.facebook,
    this.rottenTomatoes,
    this.wikiData,
    this.ivaRating,
    this.gracenote,
  });

  @override
  ExternalIds fromJson(Map<String, dynamic> json) => ExternalIds.fromJson(json);

  factory ExternalIds.fromJson(Map<String, dynamic> json) =>
      _$ExternalIdsFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ExternalIdsToJson(this);

  @override
  List<Object?> get props => [
        imdb,
        tmdb,
        iva,
        facebook,
        rottenTomatoes,
        wikiData,
        ivaRating,
        gracenote
      ];

  ExternalIds copyWith({
    Imdb? imdb,
    Tmdb? tmdb,
    Iva? iva,
    String? facebook,
    String? rottenTomatoes,
    WikiData? wikiData,
    String? ivaRating,
    String? gracenote,
  }) {
    return ExternalIds(
      imdb: imdb ?? this.imdb,
      tmdb: tmdb ?? this.tmdb,
      iva: iva ?? this.iva,
      facebook: facebook ?? this.facebook,
      rottenTomatoes: rottenTomatoes ?? this.rottenTomatoes,
      wikiData: wikiData ?? this.wikiData,
      ivaRating: ivaRating ?? this.ivaRating,
      gracenote: gracenote ?? this.gracenote,
    );
  }
}

@JsonSerializable()
class Imdb extends INetworkModel<Imdb> with EquatableMixin {
  String? url;
  String? id;

  Imdb({
    this.url,
    this.id,
  });

  @override
  Imdb fromJson(Map<String, dynamic> json) => Imdb.fromJson(json);

  factory Imdb.fromJson(Map<String, dynamic> json) => _$ImdbFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ImdbToJson(this);

  @override
  List<Object?> get props => [url, id];

  Imdb copyWith({
    String? url,
    String? id,
  }) {
    return Imdb(
      url: url ?? this.url,
      id: id ?? this.id,
    );
  }
}

@JsonSerializable()
class Tmdb extends INetworkModel<Tmdb> with EquatableMixin {
  String? url;
  String? id;

  Tmdb({
    this.url,
    this.id,
  });

  @override
  Tmdb fromJson(Map<String, dynamic> json) => Tmdb.fromJson(json);

  factory Tmdb.fromJson(Map<String, dynamic> json) => _$TmdbFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TmdbToJson(this);

  @override
  List<Object?> get props => [url, id];

  Tmdb copyWith({
    String? url,
    String? id,
  }) {
    return Tmdb(
      url: url ?? this.url,
      id: id ?? this.id,
    );
  }
}

@JsonSerializable()
class Iva extends INetworkModel<Iva> with EquatableMixin {
  String? id;

  Iva({
    this.id,
  });

  @override
  Iva fromJson(Map<String, dynamic> json) => Iva.fromJson(json);

  factory Iva.fromJson(Map<String, dynamic> json) => _$IvaFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$IvaToJson(this);

  @override
  List<Object?> get props => [id];

  Iva copyWith({
    String? id,
  }) {
    return Iva(
      id: id ?? this.id,
    );
  }
}

@JsonSerializable()
class WikiData extends INetworkModel<WikiData> with EquatableMixin {
  String? url;
  String? id;

  WikiData({
    this.url,
    this.id,
  });

  @override
  WikiData fromJson(Map<String, dynamic> json) => WikiData.fromJson(json);

  factory WikiData.fromJson(Map<String, dynamic> json) =>
      _$WikiDataFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$WikiDataToJson(this);

  @override
  List<Object?> get props => [url, id];

  WikiData copyWith({
    String? url,
    String? id,
  }) {
    return WikiData(
      url: url ?? this.url,
      id: id ?? this.id,
    );
  }
}
