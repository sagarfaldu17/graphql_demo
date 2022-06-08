import '../model/character_response_model.dart';

abstract class AuthBase {
  Future<List<CharacterModel>?> getCharacterList();
}
