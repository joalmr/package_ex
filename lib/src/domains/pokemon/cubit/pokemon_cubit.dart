import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:package_ejemplo/src/domains/pokemon/models/pokemon-model.dart';
import 'package:package_ejemplo/src/domains/pokemon/repositories/pokemon-repository.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final PokemonRepository pokemonRepository;
  PokemonCubit(this.pokemonRepository) : super(PokemonInitial());

  getPokemons() async {
    final dato = await pokemonRepository.getPokemons();
    Timer(Duration(seconds: 3), () {
      emit(PokemonData(dato));
    });
  }
}
