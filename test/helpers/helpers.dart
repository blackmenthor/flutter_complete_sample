// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_complete/core/api/api.dart';
import 'package:flutter_complete/core/credentials.dart';
import 'package:flutter_complete/core/di/di.dart';
import 'package:flutter_complete/domain/breeds/repository/breed_repository.dart';
import 'package:flutter_complete/utils/logger/logger.dart';

import '../fakes/fake_api.dart';
import '../fakes/fake_repository.dart';

export 'pump_app.dart';

Future<void> setupAllForTests() async {
  await _injectDefaultDependenciesForTests();
}

Future<void> _injectDefaultDependenciesForTests() async {
  locator.allowReassignment = true;
  locator
    ..registerSingleton<AppLogger>(AppLogger())
    ..registerSingleton<Credentials>(credentials[Environment.test]!)
    ..registerSingleton<Api>(FakeApi(
      fakeBreedApi: FakeBreedApi(),
    ))
    ..registerSingleton<BreedRepository>(FakeBreedRepository());
}
