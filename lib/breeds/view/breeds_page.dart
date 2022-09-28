import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_complete/base/widgets/base_scaffold.dart';
import 'package:flutter_complete/breeds/cubit/breeds_cubit.dart';
import 'package:flutter_complete/models/breed.dart';

class BreedsPage extends StatelessWidget {
  const BreedsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BreedsCubit>(
        create: (_) => BreedsCubit(),
        child: BaseScaffold<List<Breed>, BreedsCubit>(
          title: 'Breeds Page',
          builder: (ctx, breeds) {
            return ListView.builder(
              itemCount: breeds.length,
              itemBuilder: (ctx, idx) {
                final breed = breeds[idx];

                return ListTile(
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
