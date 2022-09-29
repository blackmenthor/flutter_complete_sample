import 'package:flutter/cupertino.dart';
import 'package:flutter_complete/di/di.dart';
import 'package:flutter_complete/hive/base_hive_box.dart';
import 'package:flutter_complete/hive/domains/breed_box.dart';
import 'package:flutter_complete/models/breed.dart';
import 'package:flutter_complete/models/breed_image.dart';
import 'package:flutter_complete/models/breed_weight.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

final hiveInstance = locator<HiveService>();

final hiveBoxNames = {
  Breed: 'Breed',
};

class HiveService {

  ValueNotifier<bool> initializedNotifier = ValueNotifier(false);
  Map<String, BaseHiveBox> boxes = {};

  BreedBox? get breed => boxes[hiveBoxNames[Breed]!] as BreedBox?;

  Future<String> get path async {
    final dir = await getApplicationSupportDirectory();
    return dir.path;
  }

  Future<void> init() async {
    initializedNotifier.value = false;
    final dbPath = await path;
    Hive.init(dbPath);
    _registerAdapters();
    await _initializeBoxes();
    initializedNotifier.value = true;
  }

  void _registerAdapters() {
    Hive
      ..registerAdapter(BreedDataAdapter())
      ..registerAdapter(WeightDataAdapter())
      ..registerAdapter(BreedImageDataAdapter());
  }

  Future<void> _initializeBoxes() async {
    final breedBox = BreedBox();
    await breedBox.init();
    boxes[hiveBoxNames[Breed]!] = BreedBox();
  }

}
