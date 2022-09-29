import 'package:flutter_complete/core/repository/base_repository.dart';
import 'package:flutter_complete/domain/breeds/models/breed.dart';
import 'package:flutter_complete/domain/breeds/repository/api_breed_repository.dart';
import 'package:flutter_complete/domain/breeds/repository/hive_breed_repository.dart';

class BreedRepository
    extends BaseRepository<Breed> {

  final cacheSource = HiveBreedRepository();
  final remoteSource = APIBreedRepository();

  Stream<List<Breed>>? get stream => cacheSource.stream;

  @override
  Future<List<Breed?>> getItems() async {
    try {
      final resp = await remoteSource.getItems();
      for (final item in resp) {
        if (item == null) continue;
        await cacheSource.addNew(item: item, id: item.id);
      }
      return cacheSource.getItems();
    } catch (ex) {
      final cachedItems = await cacheSource.getItems();
      if (cachedItems.isNotEmpty) {
        return cachedItems;
      }
      rethrow;
    }
  }

  Future<List<Breed>> search({
    required String query,
  }) async {
    final resp = await remoteSource.searchBreed(
      query: query,
    );
    return resp;
  }

  // TODO: implement getSingle
  @override
  Future<Breed> getSingle({required String id}) {
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