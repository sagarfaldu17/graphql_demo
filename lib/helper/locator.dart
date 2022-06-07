import 'package:get_it/get_it.dart';

import '../repository/auth_repository.dart';
import '../service/auth_service_graphql.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  //locator.registerLazySingleton(() => GraphqlService());

  locator.registerLazySingleton(() => GraphqlAuthService());
  locator.registerLazySingleton(() => AuthRepository());
}