import 'package:flutter/material.dart';

import '../helper/locator.dart';
import '../model/character_response_model.dart';
import '../repository/auth_repository.dart';

class MainViewModel with ChangeNotifier{
  final AuthRepository _authRepository = locator<AuthRepository>();

  CharacterListModel? characterModel;

  Future<void> getCharacterList() async {
    characterModel = await _authRepository.getCharacterList();
    notifyListeners();
  }
}