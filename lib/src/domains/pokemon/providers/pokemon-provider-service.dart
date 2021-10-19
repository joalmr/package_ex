import 'package:package_ejemplo/src/domains/pokemon/models/pokemon-model.dart';
import 'package:package_ejemplo/src/domains/pokemon/providers/pokemon-provider.dart';
import 'package:package_ejemplo/src/libs/provider/api-provider.dart';

class PokemonProviderService extends PokemonProvider {
  final ApiProvider api;
  PokemonProviderService(this.api);

  @override
  Future<PokemonModel> getPokemons() => api.get("pokeapi.co", "api/v2/type/1");
}
