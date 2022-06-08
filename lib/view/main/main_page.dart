import 'package:flutter/material.dart';

import 'widgets/button_row_section_widget.dart';
import 'widgets/character_list_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ButtonRowSectionWidget(),
              Expanded(
                child: CharacterListWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
