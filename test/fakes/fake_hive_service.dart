import 'package:flutter_complete/core/hive/hive_service.dart';
import 'package:mocktail/mocktail.dart';

class FakeHiveService extends Fake implements HiveService {
  FakeHiveService({
      this.fakeInit,
  });

  final Future<void> Function()? fakeInit;

  @override
  Future<void> init() async {
    await fakeInit!();
  }

}