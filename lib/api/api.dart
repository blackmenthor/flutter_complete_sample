import 'package:flutter_complete/api/domains/breed/breed_api.dart';
import 'package:flutter_complete/base/credentials.dart';

class Api {

  Api._({
      required this.breedApi,
  });

  // @factoryMethod
  factory Api.create({
      required Credentials credentials,
  }) {
    return Api._(
      breedApi: BreedApi(
        baseEndpoint: credentials.baseEndpoint,
      ),
    );
  }

  final BreedApi breedApi;

  BreedApi get breed => breedApi;

}
