import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/main_view_model.dart';

class ButtonRowSectionWidget extends StatelessWidget {
  const ButtonRowSectionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            _getCharacterList(context);
          },
          child: const Text('call query endPoint'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('call mutation endPoint'),
        ),
      ],
    );
  }

  void _getCharacterList(BuildContext context) {
    MainViewModel viewModel = Provider.of<MainViewModel>(
      context,
      listen: false,
    );
    viewModel.getCharacterList();
  }
}
