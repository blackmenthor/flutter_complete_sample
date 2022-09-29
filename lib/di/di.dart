import 'package:flutter_complete/api/api.dart';
import 'package:flutter_complete/base/credentials.dart';
import 'package:flutter_complete/breeds/repository/breed_repository.dart';
import 'package:flutter_complete/hive/hive_service.dart';
import 'package:flutter_complete/utils/logger/logger.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

class DependencyInjection {

  static Future<void> registerDependencies({
    required Environment env,
  }) async {
    locator
      ..registerSingleton<AppLogger>(AppLogger())
      ..registerSingleton<Credentials>(credentials[env]!)
      ..registerLazySingleton<Api>(() {
        final credentials = locator.get<Credentials>();
        return Api.create(
          credentials: credentials,
        );
      })
      ..registerSingleton<HiveService>(HiveService())
      ..registerSingleton<BreedRepository>(BreedRepository());
  }

}
