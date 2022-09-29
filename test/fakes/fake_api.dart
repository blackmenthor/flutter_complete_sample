import 'package:flutter_complete/core/api/api.dart';
import 'package:flutter_complete/domain/breeds/api/breed_api.dart';
import 'package:flutter_complete/domain/breeds/models/breed.dart';
import 'package:mocktail/mocktail.dart';

import '../helpers/test_data.dart';

class FakeApi extends Fake implements Api {
  FakeApi({
      required this.fakeBreedApi,
  });

  final BreedApi fakeBreedApi;

  @override
  BreedApi get breed => fakeBreedApi;

}

class FakeBreedApi extends Fake implements BreedApi {
  FakeBreedApi({
      this.fakeBreeds,
  });

  final List<Breed>? fakeBreeds;

  @override
  Future<List<Breed>> getBreeds({String? query}) {
    return Future.value(fakeBreeds ?? [
      fakeBreed1,
    ]);
  }

}

