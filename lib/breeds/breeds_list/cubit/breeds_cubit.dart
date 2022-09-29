import 'package:flutter_complete/api/api.dart';
import 'package:flutter_complete/api/domains/breed/breed_api.dart';
import 'package:flutter_complete/base/cubit/base_cubit.dart';
import 'package:flutter_complete/base/cubit/states.dart';
import 'package:flutter_complete/di/di.dart';
import 'package:flutter_complete/exceptions/app_exception.dart';
import 'package:flutter_complete/models/breed.dart';

class BreedsCubit extends BaseCubit<List<Breed>> {

  final api = locator.get<Api>();

  BreedApi get breedApi => api.breedApi;

  @override
  Future<List<Breed>> loadData() => breedApi.getBreeds();

  Future<void> search({
    required String query,
  }) async {
    emit(
      BaseCubitLoadingState(),
    );
    try {
      final resp = await (query.isEmpty
          ? loadData()
          : breedApi.getBreeds(
        query: query,
      ));
      emit(
        BaseCubitLoadedState(data: resp),
      );
    } on AppException catch (ex) {
      emit(
        BaseCubitErrorState(error: ex),
      );
    } catch (ex) {
      emit(
          BaseCubitErrorState(
              error: DefaultAppException(),
          ),
      );
    }
  }

}
