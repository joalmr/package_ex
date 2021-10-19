import 'package:http/http.dart';

abstract class PokemonProvider {
  Future<Response> getPokemons();
}
