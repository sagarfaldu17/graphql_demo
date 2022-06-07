import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/main_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _getCharacterList(context);
                },
                child: const Text('call query endPoint'),
              ),
              ElevatedButton(
                onPressed: () {
                },
                child: const Text('call mutation endPoint'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

extension _ on  MainPage {

  void _getCharacterList(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(
      context,
      listen: false,
    );
    viewModel.getCharacterList();
  }
}
