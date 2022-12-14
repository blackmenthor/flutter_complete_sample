import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete/core/cubit/base_cubit.dart';
import 'package:flutter_complete/core/cubit/states.dart';
import 'package:flutter_complete/core/extensions/base_bloc_state_extension.dart';
import 'package:flutter_complete/ui/widgets/base_scaffold.dart';

const kAppBarBottomHeight = 54.0;

class BaseLoadableScaffold<T, R extends BaseCubit<T>> extends StatelessWidget {
  const BaseLoadableScaffold({
    Key? key,
    required this.builder,
    this.title,
    this.appBarBottom,
    this.appBarBottomHeight = kAppBarBottomHeight,
    this.listener,
    this.floatingActionButton,
  }) : super(key: key);

  final Widget Function(BuildContext, T?) builder;
  final String? title;
  final Widget Function(BuildContext)? appBarBottom;
  final double appBarBottomHeight;
  final Function(BaseCubitState)? listener;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: title,
        floatingActionButton: floatingActionButton,
        appBarBottom: appBarBottom == null
            ? null
            : PreferredSize(
          preferredSize: Size.fromHeight(appBarBottomHeight),
          child: appBarBottom!(context),
        ),
        builder: (ctx)
          => BlocConsumer<R, BaseCubitState>(
            listener: (ctx, BaseCubitState state) {
              if (listener != null) {
                listener!(state);
              }
            },
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
