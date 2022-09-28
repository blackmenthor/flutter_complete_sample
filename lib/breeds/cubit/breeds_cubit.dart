import 'package:flutter_complete/api/api.dart';
import 'package:flutter_complete/api/domains/breed/breed_api.dart';
import 'package:flutter_complete/base/cubit/base_cubit.dart';
import 'package:flutter_complete/di/di.dart';
import 'package:flutter_complete/models/breed.dart';

class BreedsCubit extends BaseCubit<List<Breed>> {

  final api = locator.get<Api>();

  BreedApi get breedApi => api.breedApi;

  @override
  Future<List<Breed>> loadData() => breedApi.getBreeds();

}
