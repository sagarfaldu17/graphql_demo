// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:graphql_demo/env.dart';
import 'package:graphql_demo/view/main_page.dart';
import 'package:provider/provider.dart';

import 'helper/locator.dart';
import 'helper/routes.dart';
import 'view_model/main_view_model.dart';

void main() async {
  BuildEnvironment.init(
      flavor: BuildFlavor.production,
      baseUrl: 'https://rickandmortyapi.com/graphql/');
  assert(env != null);
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        // onGenerateTitle: (BuildContext context) => S.of(context).appTitle,
        localizationsDelegates: const [
          // S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //supportedLocales: S.delegate.supportedLocales,
        home: ChangeNotifierProvider(
          create: (context) => MainViewModel(),
          child:  const MainPage(),
        ),
        routes: Routes.getRoutes(),
      );
  }
}
