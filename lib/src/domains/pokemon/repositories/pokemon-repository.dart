import 'package:package_ejemplo/src/domains/pokemon/providers/pokemon-provider.dart';
import 'package:package_ejemplo/src/domains/pokemon/repositories/pokemon-mapping.dart';

class PokemonRepository {
  final PokemonProvider pokemonProvider;
  final PokemonMapping pokemonMapping;

  PokemonRepository(this.pokemonProvider, this.pokemonMapping);

  getPokemons() {
    return Stream.fromFuture(this.pokemonProvider.getPokemons())
        .map(this.pokemonMapping.toResponse)
        .handleError(this.pokemonMapping.toError)
        .first;
  }
}
