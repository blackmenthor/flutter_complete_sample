import 'package:flutter_complete/core/cubit/base_cubit.dart';
import 'package:flutter_complete/core/di/di.dart';
import 'package:flutter_complete/core/hive/hive_service.dart';

class StartPageCubit extends BaseCubit<bool> {

  final hiveService = locator<HiveService>();

  @override
  Future<bool> loadData() async {
    // kickOff the app
    await hiveService.init();
    return true;
  }

}
