import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_complete/core/cubit/states.dart';
import 'package:flutter_complete/core/di/di.dart';
import 'package:flutter_complete/core/hive/hive_service.dart';
import 'package:flutter_complete/domain/start/cubit/start_page_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fakes/fake_hive_service.dart';
import '../../../helpers/helpers.dart';

void main() {

  group('StartPageCubit tests', () {

    setUpAll(setupAllForTests);

    blocTest<StartPageCubit, BaseCubitState>(
      'emits true once the initialization is done',
      build: StartPageCubit.new,
      expect: () => [
        isA<BaseCubitLoadedState>(),
      ],
    );

    blocTest<StartPageCubit, BaseCubitState>(
      'emits error in case of error',
      build: () {
        final fakeHiveService = FakeHiveService(
          fakeInit: () {
            throw Exception();
          },
        );
        locator.registerSingleton<HiveService>(fakeHiveService);

        return StartPageCubit();
      },
      expect: () => [
        isA<BaseCubitErrorState>(),
      ],
    );

  });

}