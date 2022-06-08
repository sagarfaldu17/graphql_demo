import '../model/character_response_model.dart';

abstract class AuthBase {
  Future<CharacterListModel?> getCharacterList();
}
