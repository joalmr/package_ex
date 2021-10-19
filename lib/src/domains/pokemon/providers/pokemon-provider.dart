import 'package:package_ejemplo/src/domains/pokemon/models/pokemon-model.dart';

abstract class PokemonProvider {
  Future<PokemonModel> getPokemons();
}
