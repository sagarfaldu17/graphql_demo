import 'package:flutter/material.dart';

import '../helper/locator.dart';
import '../model/character_model.dart';
import '../repository/auth_repository.dart';

class MainViewModel with ChangeNotifier{
  final AuthRepository _authRepository = locator<AuthRepository>();

  Future<void> getCharacterList() async {
    List<CharacterModel>? characterList = await _authRepository.getCharacterList();
    print('characterList: $characterList');
  }

}