import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:package_ejemplo/src/domains/pokemon/providers/pokemon-provider-service.dart';
import 'package:package_ejemplo/src/domains/pokemon/repositories/pokemon-mapping.dart';
import 'package:package_ejemplo/src/domains/pokemon/repositories/pokemon-repository.dart';
import 'package:package_ejemplo/src/libs/provider/api-provider.dart';

class ModuleContainer {
  Injector initialize(Injector injector) {
    this.initializeDependencies(injector);
    return injector;
  }

  initializeDependencies(Injector injector) {
    // initialize basic  providers
    injector.map<ApiProvider>((i) => ApiProvider(), isSingleton: true);

    // initialize basic  providers
    injector.map<PokemonProviderService>(
        (i) => PokemonProviderService(i.get<ApiProvider>()),
        isSingleton: false);

    //initializeMapping
    injector.map<PokemonMapping>((i) => PokemonMapping(), isSingleton: true);

    // initialize repositories
    injector.map<PokemonRepository>(
        (i) => PokemonRepository(
            i.get<PokemonProviderService>(), i.get<PokemonMapping>()),
        isSingleton: false);
  }
}
