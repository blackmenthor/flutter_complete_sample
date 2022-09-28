import 'package:flutter_complete/api/base/base_api.dart';
import 'package:flutter_complete/models/breed.dart';

class BreedApi extends BaseApi<Breed> {
  BreedApi({
    required String baseEndpoint,
  }) : super(
      baseEndpoint: baseEndpoint,
      serializer: Breed.serializer,
  );

  Future<List<Breed>> getBreeds() async {
    return getList(
      path: 'breeds',
    );
  }

}