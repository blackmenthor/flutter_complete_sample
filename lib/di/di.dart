import 'package:flutter_complete/api/api.dart';
import 'package:flutter_complete/base/credentials.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class DependencyInjection {

  static Future<void> registerDependencies({
    required Environment env,
  }) async {
    locator
      ..registerSingleton<Credentials>(credentials[env]!)
      ..registerLazySingleton<Api>(() {
        final credentials = locator.get<Credentials>();
        return Api.create(
          credentials: credentials,
        );
      });
  }

}
