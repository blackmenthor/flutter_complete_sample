// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete/app/cubit/app_cubit.dart';
import 'package:flutter_complete/app/cubit/state.dart';
import 'package:flutter_complete/core/di/di.dart';
import 'package:flutter_complete/core/router/router.dart';
import 'package:flutter_complete/l10n/l10n.dart';
import 'package:flutter_complete/ui/theme/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  App({
    Key? key,
  }) : super(key: key);

  AppTheme get theme => AppTheme();
  final appCubit = locator.get<AppCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
        bloc: appCubit,
        builder: (ctx, state) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            behavior: HitTestBehavior.opaque,
            child: MaterialApp.router(
              theme: theme.lightTheme,
              darkTheme: theme.darkTheme,
              themeMode: state.themeMode,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: appRouter,
            ),
          );
        },
    );
  }
}
