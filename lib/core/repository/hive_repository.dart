import 'package:flutter_complete/core/hive/base_hive_box.dart';
import 'package:flutter_complete/core/hive/hive_service.dart';
import 'package:flutter_complete/core/repository/base_repository.dart';

abstract class HiveRepository<T> implements BaseRepository<T> {

  final hiveService = hiveInstance;
  BaseHiveBox<T> get _box {
    return hiveService.boxes[hiveBoxNames[T]]! as BaseHiveBox<T>;
  }

  bool get closed => _box.closed;

  Stream<List<T>>? get stream => _box.stream;

  @override
  Future<T> addNew({required T item, required String id}) async {
    await _box.putItem(id: id, item: item);
    return item;
  }

  @override
  Future<void> deleteItem({required String id}) async {
    await _box.deleteItem(id: id);
  }

  @override
  Future<List<T>> getItems() async {
    final resp = _box.getAll();
    return Future.value(resp);
  }

  @override
  Future<T> getSingle({required String id}) {
    final resp = _box?.getSingle(id: id);
    return Future.value(resp);
  }

}