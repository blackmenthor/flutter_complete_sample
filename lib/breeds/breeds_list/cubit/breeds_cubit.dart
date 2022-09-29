import 'package:flutter_complete/base/cubit/base_cubit.dart';
import 'package:flutter_complete/base/cubit/states.dart';
import 'package:flutter_complete/breeds/repository/breed_repository.dart';
import 'package:flutter_complete/di/di.dart';
import 'package:flutter_complete/exceptions/app_exception.dart';
import 'package:flutter_complete/models/breed.dart';

// TODO: CATCH DATA FROM STREAM INSTEAD
class BreedsCubit extends BaseCubit<List<Breed>> {

  final breedRepository = locator<BreedRepository>();

  @override
  Future<List<Breed>?> loadData() => breedRepository.loadData();

  Future<void> search({
    required String query,
  }) async {
    emit(
      BaseCubitLoadingState(),
    );
    try {
      final resp = await breedRepository.search(query: query);

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
