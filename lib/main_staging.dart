// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete/app/app.dart';
import 'package:flutter_complete/app/cubit/app_cubit.dart';
import 'package:flutter_complete/bootstrap.dart';
import 'package:flutter_complete/core/credentials.dart';
import 'package:flutter_complete/core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.registerDependencies(env: Environment.staging);

  bootstrap(
        () => BlocProvider(
      create: (_) => locator.get<AppCubit>(),
      child: App(),
    ),
  );
}
