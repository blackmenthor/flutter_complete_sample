import 'package:flutter_complete/breeds/repository/api_breed_repository.dart';
import 'package:flutter_complete/breeds/repository/hive_breed_repository.dart';
import 'package:flutter_complete/models/breed.dart';

// TODO: abstraction layer
class BreedRepository {

  final cacheSource = HiveBreedRepository();
  final remoteSource = APIBreedRepository();

  Stream<List<Breed>>? get stream => cacheSource.stream;

  Future<List<Breed>?> loadData() async {
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
    }
    return null;
  }

  Future<List<Breed>> search({
    required String query,
  }) async {
    final resp = await remoteSource.searchBreed(
      query: query,
    );
    return resp;
  }

}