// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purshare_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PurshareModel _$PurshareModelFromJson(Map<String, dynamic> json) =>
    PurshareModel(
      variant: json['variant'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Results.fromJson(e as Map<String, dynamic>))
          .toList(),
      updated: json['updated'] as String?,
      term: json['term'] as String?,
      statusCode: json['statusCode'] as int?,
    );

Map<String, dynamic> _$PurshareModelToJson(PurshareModel instance) =>
    <String, dynamic>{
      'variant': instance.variant,
      'results': instance.results,
      'updated': instance.updated,
      'term': instance.term,
      'statusCode': instance.statusCode,
    };

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      locations: (json['locations'] as List<dynamic>?)
          ?.map((e) => Locations.fromJson(e as Map<String, dynamic>))
          .toList(),
      weight: json['weight'] as int?,
      id: json['id'] as String?,
      externalIds: json['externalIds'] == null
          ? null
          : ExternalIds.fromJson(json['externalIds'] as Map<String, dynamic>),
      picture: json['picture'] as String?,
      provider: json['provider'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'locations': instance.locations,
      'weight': instance.weight,
      'id': instance.id,
      'externalIds': instance.externalIds,
      'picture': instance.picture,
      'provider': instance.provider,
      'name': instance.name,
    };

Locations _$LocationsFromJson(Map<String, dynamic> json) => Locations(
      displayName: json['display_name'] as String?,
      id: json['id'] as String?,
      url: json['url'] as String?,
      name: json['name'] as String?,
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$LocationsToJson(Locations instance) => <String, dynamic>{
      'display_name': instance.displayName,
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'icon': instance.icon,
    };

ExternalIds _$ExternalIdsFromJson(Map<String, dynamic> json) => ExternalIds(
      imdb: json['imdb'] == null
          ? null
          : Imdb.fromJson(json['imdb'] as Map<String, dynamic>),
      tmdb: json['tmdb'] == null
          ? null
          : Tmdb.fromJson(json['tmdb'] as Map<String, dynamic>),
      iva: json['iva'] == null
          ? null
          : Iva.fromJson(json['iva'] as Map<String, dynamic>),
      facebook: json['facebook'] as String?,
      rottenTomatoes: json['rottenTomatoes'] as String?,
      wikiData: json['wikiData'] == null
          ? null
          : WikiData.fromJson(json['wikiData'] as Map<String, dynamic>),
      ivaRating: json['ivaRating'] as String?,
      gracenote: json['gracenote'] as String?,
    );

Map<String, dynamic> _$ExternalIdsToJson(ExternalIds instance) =>
    <String, dynamic>{
      'imdb': instance.imdb,
      'tmdb': instance.tmdb,
      'iva': instance.iva,
      'facebook': instance.facebook,
      'rottenTomatoes': instance.rottenTomatoes,
      'wikiData': instance.wikiData,
      'ivaRating': instance.ivaRating,
      'gracenote': instance.gracenote,
    };

Imdb _$ImdbFromJson(Map<String, dynamic> json) => Imdb(
      url: json['url'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ImdbToJson(Imdb instance) => <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
    };

Tmdb _$TmdbFromJson(Map<String, dynamic> json) => Tmdb(
      url: json['url'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$TmdbToJson(Tmdb instance) => <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
    };

Iva _$IvaFromJson(Map<String, dynamic> json) => Iva(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$IvaToJson(Iva instance) => <String, dynamic>{
      'id': instance.id,
    };

WikiData _$WikiDataFromJson(Map<String, dynamic> json) => WikiData(
      url: json['url'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$WikiDataToJson(WikiData instance) => <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
    };
