// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_complete/app/app.dart';
import 'package:flutter_complete/base/credentials.dart';
import 'package:flutter_complete/bootstrap.dart';
import 'package:flutter_complete/di/di.dart';

void main() {
  DependencyInjection.registerDependencies(env: Environment.staging);

  bootstrap(() => const App());
}
