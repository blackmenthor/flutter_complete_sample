import 'package:flutter/material.dart';
import 'package:flutter_complete/base/widgets/base_scaffold.dart';
import 'package:flutter_complete/breeds/breeds_list/view/breeds_list_page.dart';
import 'package:flutter_complete/breeds/breeds_page/view/breeds_page.dart';
import 'package:flutter_complete/extensions/context_extensions.dart';
import 'package:flutter_complete/models/breed.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const BreedsListPage();
      },
      routes: [
        GoRoute(
          path: 'breed/:id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.params['id'];
            return BaseScaffold(
              title: 'Breed page',
              builder: (ctx) => Center(
                child: Text(
                  id ?? 'No id supplied!',
                  style: ctx.textTheme.headline1,
                ),
              ),
            );
            return BreedsPage(breed: Breed(
              id: '1',
              name: 'Angga',
              cfaUrl: null,
              image: null,
              weight: null,
            ));
          },
        ),
      ],
    ),
  ],
);