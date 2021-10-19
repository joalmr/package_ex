import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_ejemplo/src/domains/pokemon/cubit/pokemon_cubit.dart';

class PokemonView extends StatelessWidget {
  const PokemonView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => PokemonCubit()..getPokemons(),
          child: BlocBuilder<PokemonCubit, PokemonState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case PokemonInitial:
                  return Container(color: Colors.green);
                case PokemonData:
                  return Container(color: Colors.blue);
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
