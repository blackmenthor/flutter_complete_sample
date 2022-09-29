import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete/base/cubit/base_cubit.dart';
import 'package:flutter_complete/base/cubit/states.dart';
import 'package:flutter_complete/base/widgets/base_scaffold.dart';
import 'package:flutter_complete/extensions/base_bloc_state_extension.dart';

const kAppBarBottomHeight = 54.0;

class BaseLoadableScaffold<T, R extends BaseCubit<T>> extends StatelessWidget {
  const BaseLoadableScaffold({
    Key? key,
    required this.builder,
    this.title,
    this.appBarBottom,
    this.appBarBottomHeight = kAppBarBottomHeight,
  }) : super(key: key);

  final Widget Function(BuildContext, T) builder;
  final String? title;
  final Widget Function(BuildContext)? appBarBottom;
  final double appBarBottomHeight;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: title,
        appBarBottom: PreferredSize(
          preferredSize: Size.fromHeight(appBarBottomHeight),
          child: appBarBottom!(context),
        ),
        builder: (ctx)
          => BlocBuilder<R, BaseCubitState>(
            builder: (ctx, BaseCubitState state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state.hasError) {
                state = state as BaseCubitErrorState;
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: Text(
                      state.error.userFriendlyMessage,
                    ),
                  ),
                );
              }

              final data = (state as BaseCubitLoadedState<T>).data;
              return builder(context, data);
            },
          ),
    );
  }
}
