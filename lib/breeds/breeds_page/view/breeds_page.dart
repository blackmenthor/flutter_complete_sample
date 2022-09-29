import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete/base/widgets/base_scaffold.dart';
import 'package:flutter_complete/models/breed.dart';
import 'package:flutter_complete/extensions/context_extensions.dart';

class BreedsPage extends StatelessWidget {
  const BreedsPage({
    Key? key,
    required this.breed,
  }) : super(key: key);

  final Breed breed;

  Widget _oneLineText({
    required BuildContext context,
    required String title,
    required String content,
  }) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: title,
              ),
              const TextSpan(
                text: ': ',
              ),
            ],
          ),
          style: context.textTheme.bodyMedium,
        ),
        const SizedBox(width: 8,),
        Expanded(
          child: Text(
            content,
            style: context.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  Widget _mainWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                  imageUrl: breed.image!.url,
                  height: 100,
              ),
            ),
          ),
          _oneLineText(
              context: context,
              title: 'Name',
              content: breed.name,
          ),
          const SizedBox(height: 16,),
          if (breed.weight != null) ...[
            _oneLineText(
              context: context,
              title: 'Name',
              content: breed.weight!.imperial,
            ),
            const SizedBox(height: 16,),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: breed.name,
        builder: _mainWidget,
    );
  }
}
