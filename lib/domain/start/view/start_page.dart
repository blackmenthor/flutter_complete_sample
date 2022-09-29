import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete/core/cubit/states.dart';
import 'package:flutter_complete/domain/start/cubit/start_page_cubit.dart';
import 'package:flutter_complete/ui/widgets/base_loadable_scaffold.dart';
import 'package:go_router/go_router.dart';

class StartPage extends StatelessWidget {
  const StartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StartPageCubit(),
      child: BaseLoadableScaffold<bool, StartPageCubit>(
          listener: (state) {
            if (state is BaseCubitLoadedState) {
              context.go('/breed');
            }
          },
          builder: (ctx, value) {
            return const SizedBox();
          },
      ),
    );
  }
}
