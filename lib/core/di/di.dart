import 'package:flutter_complete/app/cubit/app_cubit.dart';
import 'package:flutter_complete/core/api/api.dart';
import 'package:flutter_complete/core/credentials.dart';
import 'package:flutter_complete/core/hive/hive_service.dart';
import 'package:flutter_complete/domain/breeds/repository/breed_repository.dart';
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
      ..registerSingleton<BreedRepository>(BreedRepository())
      ..registerSingleton<AppCubit>(AppCubit());
  }

}
