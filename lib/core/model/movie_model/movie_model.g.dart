// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

part of 'movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchAdapter extends TypeAdapter<Search> {
  @override
  final int typeId = 0;

  @override
  Search read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Search(
      title: fields[0] as String?,
      year: fields[1] as String?,
      imdbID: fields[2] as String?,
      type: fields[3] as String?,
      poster: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Search obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.year)
      ..writeByte(2)
      ..write(obj.imdbID)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.poster);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is SearchAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      search: (json['Search'] as List<dynamic>?)?.map((e) => Search.fromJson(e as Map<String, dynamic>)).toList(),
      totalResults: json['TotalResults'] as String?,
      response: json['Response'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) => <String, dynamic>{
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
      'Title': instance.title,
      'Year': instance.year,
      'imdbID': instance.imdbID,
      'Type': instance.type,
      'Poster': instance.poster,
    };
