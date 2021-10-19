part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonData extends PokemonState {
  final PokemonModel pokemon;

  PokemonData(this.pokemon);
}
