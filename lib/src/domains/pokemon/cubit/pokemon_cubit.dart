import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:package_ejemplo/src/domains/pokemon/models/pokemon-model.dart';
import 'package:package_ejemplo/src/domains/pokemon/repositories/pokemon-repository.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit(this.pokemon) : super(PokemonInitial());

  final PokemonRepository pokemon;

  getPokemons() {
    final dato = pokemon.getPokemons();
    Timer(Duration(seconds: 2), () {
      emit(PokemonData(dato));
    });
  }
}
