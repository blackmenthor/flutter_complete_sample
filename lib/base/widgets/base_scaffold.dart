import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete/base/cubit/base_cubit.dart';
import 'package:flutter_complete/base/cubit/states.dart';
import 'package:flutter_complete/extensions/base_bloc_state_extension.dart';

class BaseScaffold<T, R extends BaseCubit<T>> extends StatelessWidget {
  const BaseScaffold({
    Key? key,
    required this.title,
    required this.builder,
  }) : super(key: key);

  final String title;
  final Widget Function(BuildContext, T) builder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
      ),
      body: BlocBuilder<R, BaseCubitState>(
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
