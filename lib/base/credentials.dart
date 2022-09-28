enum Environment {
  dev,
  staging,
  prod
}

abstract class Credentials {

  const Credentials({
      required this.baseEndpoint,
      required this.env,
  });

  final String baseEndpoint;
  final Environment env;
}

class DevCredentials extends Credentials {
  DevCredentials() : super(
    baseEndpoint: 'https://api.thecatapi.com/v1/',
    env: Environment.dev,
  );
}

class StagingCredentials extends Credentials {
  StagingCredentials() : super(
    baseEndpoint: 'https://api.thecatapi.com/v1/',
    env: Environment.staging,
  );
}

class ProdCredentials extends Credentials {
  ProdCredentials() : super(
    baseEndpoint: 'https://api.thecatapi.com/v1/',
    env: Environment.prod,
  );
}

final credentials = {
  Environment.dev: DevCredentials(),
  Environment.staging: StagingCredentials(),
  Environment.prod: ProdCredentials(),
};
