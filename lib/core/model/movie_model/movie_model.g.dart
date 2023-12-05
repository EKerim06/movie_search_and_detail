// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      search: (json['Search'] as List<dynamic>?)
          ?.map((e) => Search.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['TotalResults'] as String?,
      response: json['Response'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'Search': instance.search,
      'TotalResults': instance.totalResults,
      'Response': instance.response,
    };

Search _$SearchFromJson(Map<String, dynamic> json) => Search(
      title: json['Title'] as String?,
      year: json['Year'] as String?,
      imdbID: json['imdbID'] as String?,
      type: json['Type'] as String?,
      poster: json['Poster'] as String?,
    );

Map<String, dynamic> _$SearchToJson(Search instance) => <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'imdbID': instance.imdbID,
      'type': instance.type,
      'poster': instance.poster,
    };
