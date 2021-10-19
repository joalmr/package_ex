import 'package:http/http.dart';
import 'package:package_ejemplo/src/domains/pokemon/models/pokemon-model.dart';

class PokemonMapping {
  PokemonModel fromJsontoPokemon(Response response) {
    return pokemonModelFromJson(response.body);
  }

  toError(error) {
    if (300 <= error.status && error.status < 400) {
      throw "Error serie 300";
    }
    if (400 <= error.status && error.status < 500) {
      throw "Error serie 400";
    }
  }
}
