import 'package:flutter_complete/models/breed.dart';
import 'package:flutter_complete/models/breed_image.dart';
import 'package:flutter_complete/models/breed_weight.dart';

const fakeBreed1 = Breed(
    id: 'BREED_1',
    name: 'Breed 1',
    cfaUrl: '',
    weight: Weight(
      imperial: '',
      metric: '',
    ),
    image: BreedImage(
      id: 'IMAGE',
      height: 100,
      width: 100,
      url: '',
    ),
);