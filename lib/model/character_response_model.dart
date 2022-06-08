import 'package:json_annotation/json_annotation.dart';
part 'character_response_model.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class CharacterListModel {
  CharacterListModel({
    required this.results,
  });

  List<CharacterModel> results;

  factory CharacterListModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterListModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterListModelToJson(this);
}


@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class CharacterModel {
  CharacterModel({
    this.id,
    this.name,
    this.status,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterModelFromJson(json);

  final String? id;
  final String? name;
  final String? status;

  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}
