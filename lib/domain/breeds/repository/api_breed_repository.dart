import 'package:flutter_complete/core/api/api.dart';
import 'package:flutter_complete/core/di/di.dart';
import 'package:flutter_complete/core/repository/base_repository.dart';
import 'package:flutter_complete/domain/breeds/api/breed_api.dart';
import 'package:flutter_complete/domain/breeds/models/breed.dart';

class APIBreedRepository extends BaseRepository<Breed> {

  final api = locator.get<Api>();

  BreedApi get breedApi => api.breed;

  Future<List<Breed>> searchBreed({String? query})
      => breedApi.getBreeds(
        query: query,
      );

  @override
  Future<List<Breed?>> getItems()
    => breedApi.getBreeds();

  @override
  Future<Breed> getSingle({required String id}) {
    // TODO: implement getSingle
    throw UnimplementedError();
  }

  // TODO: not implemented
  @override
  Future<Breed> addNew({required Breed item, required String id}) {
    throw UnimplementedError();
  }

  // TODO: not implemented
  @override
  Future<void> deleteItem({required String id}) {
    throw UnimplementedError();
  }

}
