import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_ejemplo/src/domains/pokemon/cubit/pokemon_cubit.dart';
import 'package:package_ejemplo/src/domains/pokemon/providers/pokemon-provider-service.dart';
import 'package:package_ejemplo/src/domains/pokemon/repositories/pokemon-mapping.dart';
import 'package:package_ejemplo/src/domains/pokemon/repositories/pokemon-repository.dart';
import 'package:package_ejemplo/src/libs/provider/api-provider.dart';

class PokemonView extends StatelessWidget {
  const PokemonView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => PokemonCubit(
            PokemonRepository(
              PokemonProviderService(ApiProvider()),
              PokemonMapping(),
            ),
          )..getPokemons(),
          child: BlocConsumer<PokemonCubit, PokemonState>(
            listener: (context, state) {},
            builder: (context, state) {
              switch (state.runtimeType) {
                case PokemonInitial:
                  return Container(color: Colors.red);
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
