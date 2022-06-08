import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/main_view_model.dart';

class CharacterListWidget extends StatelessWidget {
  const CharacterListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _viewModel = Provider.of<MainViewModel>(context, listen: true,);

    return _viewModel.characterList != null ? ListView.builder(
        shrinkWrap: true,
        itemCount: _viewModel.characterList?.length,
        itemBuilder: (context, index) {
          final character = _viewModel.characterList?[index];

          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: Colors.black,
              ),
            ),
            elevation: 16,
            shadowColor: Colors.blueAccent,
            child: ListTile(
                leading: const Icon(Icons.flight_land),
              title: Text(
                  character?.name ?? 'name'),
              subtitle:
              Text(character?.status ?? 'status'),
                trailing: const Icon(Icons.add),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          );
        }) : const Offstage();
  }
}
