abstract class BaseRepository<T> {

  Future<T> getSingle({
    required String id,
  });

  Future<List<T?>> getItems();

  Future<T> addNew({
    required T item,
    required String id,
  });

  Future<void> deleteItem({
    required String id,
  });

}