import '../base/auth_base.dart';
import '../service/base/auth_service.dart';
import '../helper/locator.dart';
import '../model/character_model.dart';
import '../service/auth_service_graphql.dart';

class AuthRepository implements AuthBase {
  final AuthService _service = locator<GraphqlAuthService>();

  @override
  Future<List<CharacterModel>?> getCharacterList() async {
    return await _service.getCharacterList();
  }
}
