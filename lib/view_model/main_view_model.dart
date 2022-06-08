import 'package:flutter/material.dart';

import '../helper/locator.dart';
import '../model/character_response_model.dart';
import '../repository/auth_repository.dart';

class MainViewModel with ChangeNotifier{
  final AuthRepository _authRepository = locator<AuthRepository>();

  List<CharacterModel>? characterList;

  Future<void> getCharacterList() async {
    characterList = await _authRepository.getCharacterList();
    notifyListeners();
  }

}