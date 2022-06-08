import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/main/main_page.dart';
import '../view_model/main_view_model.dart';

class Routes {
  static const String MAIN_PAGE = '/main_page';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      MAIN_PAGE: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => MainViewModel(),
            child: const MainPage(),
          ),
    };
  }
}
