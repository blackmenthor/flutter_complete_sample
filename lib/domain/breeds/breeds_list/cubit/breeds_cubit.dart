import 'package:flutter_complete/core/cubit/base_cubit.dart';
import 'package:flutter_complete/core/cubit/states.dart';
import 'package:flutter_complete/core/di/di.dart';
import 'package:flutter_complete/core/exceptions/app_exception.dart';
import 'package:flutter_complete/domain/breeds/models/breed.dart';
import 'package:flutter_complete/domain/breeds/repository/breed_repository.dart';

class BreedsCubit extends BaseCubit<List<Breed?>> {

  final breedRepository = locator<BreedRepository>();

  @override
  Future<List<Breed?>> loadData() => breedRepository.getItems();

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
