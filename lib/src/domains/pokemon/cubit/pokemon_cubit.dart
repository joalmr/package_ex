import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:package_ejemplo/src/domains/pokemon/models/pokemon-model.dart';
import 'package:package_ejemplo/src/domains/pokemon/providers/pokemon-provider-service.dart';
import 'package:package_ejemplo/src/domains/pokemon/repositories/pokemon-mapping.dart';
import 'package:package_ejemplo/src/domains/pokemon/repositories/pokemon-repository.dart';
import 'package:package_ejemplo/src/libs/provider/api-provider.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  final PokemonRepository pokemon = PokemonRepository(
    PokemonProviderService(ApiProvider()),
    PokemonMapping(),
  );

  getPokemons() {
    final dato = pokemon.getPokemons();
    Timer(Duration(seconds: 5), () {
      emit(PokemonData(dato));
    });
  }
}
