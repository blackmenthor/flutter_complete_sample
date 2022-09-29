import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete/base/widgets/base_loadable_scaffold.dart';
import 'package:flutter_complete/base/widgets/base_search_text_Field.dart';
import 'package:flutter_complete/breeds/breeds_list/cubit/breeds_cubit.dart';
import 'package:flutter_complete/models/breed.dart';
import 'package:go_router/go_router.dart';

class BreedsListPage extends StatelessWidget {
  const BreedsListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BreedsCubit>(
        create: (_) => BreedsCubit(),
        child: BaseLoadableScaffold<List<Breed>, BreedsCubit>(
          title: 'Breeds Page',
          appBarBottom: (ctx) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: BaseSearchTextField(
                hint: 'Search breeds here...',
                onChanged: (query) {
                  ctx.read<BreedsCubit>().search(
                    query: query,
                  );
                },
              ),
            );
          },
          builder: (ctx, breeds) {
            return ListView.builder(
              itemCount: breeds!.length,
              itemBuilder: (ctx, idx) {
                final breed = breeds[idx];

                return ListTile(
                  key: ValueKey(breed.id),
                  onTap: () => context.go('/breed/${breed.id}'),
                  leading: Text(
                      (idx+1).toString(),
                  ),
                  title: Row(
                    children: [
                      if (breed.image != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                              imageUrl: breed.image!.url,
                              fit: BoxFit.cover,
                              height: 48,
                              width: 48,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                      Expanded(
                        child: Text(
                          breed.name,
                        ),
                      ),
                    ],
                  ),
                  subtitle: breed.weight == null
                      ? null
                      : Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Weight: ',
                        ),
                        TextSpan(
                          text: breed.weight!.metric,
                        ),
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: breed.weight!.imperial,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
    );
  }
}
