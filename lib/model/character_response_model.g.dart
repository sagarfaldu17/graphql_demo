// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterListModel _$CharacterListModelFromJson(Map<String, dynamic> json) =>
    CharacterListModel(
      results: (json['results'] as List<dynamic>)
          .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterListModelToJson(CharacterListModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
    };
