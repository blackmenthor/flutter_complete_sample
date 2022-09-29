import 'package:flutter_complete/api/base/base_api.dart';
import 'package:flutter_complete/models/breed.dart';

class BreedApi extends BaseApi<Breed> {
  BreedApi({
    required String baseEndpoint,
  }) : super(
      baseEndpoint: baseEndpoint,
      serializer: Breed.serializer,
  );

  Future<List<Breed>> getBreeds({
    String? query,
  }) async {
    final queryParams = <String, dynamic>{};
    if (query != null) {
      queryParams['q'] = query;
    }
    return getList(
      path: (query?.isEmpty ?? true)
          ? 'breeds'
          : 'breeds/search',
      queryParams: queryParams,
    );
  }

}