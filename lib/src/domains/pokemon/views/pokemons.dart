import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:package_ejemplo/src/domains/pokemon/cubit/pokemon_cubit.dart';
import 'package:package_ejemplo/src/domains/pokemon/repositories/pokemon-repository.dart';
import 'package:package_ejemplo/src/libs/dependency-injection/module-container.dart';

class PokemonView extends StatelessWidget {
  final injector = ModuleContainer().initialize(Injector());

  PokemonView();

  @override
  Widget build(BuildContext context) {
    final pokemonRepository = injector.get<PokemonRepository>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => PokemonCubit(pokemonRepository)..getPokemons(),
          child: BlocBuilder<PokemonCubit, PokemonState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case PokemonInitial:
                  return Container(color: Colors.green);
                case PokemonData:
                  return Container(
                      color: Colors.blue,
                      child: Center(
                          child:
                              Text((state as PokemonData).pokemon.name ?? '')));
                default:
                  return Container(color: Colors.white);
              }
            },
          ),
        ),
      ),
    );
  }
}
