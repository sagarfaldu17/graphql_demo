import '../model/character_model.dart';

abstract class AuthBase {
  Future<List<CharacterModel>?> getCharacterList();
}
