import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs_flutter_task/core/app/di.dart';
import 'package:ososs_flutter_task/features/pokemons/presentation/bloc/pokemons_bloc.dart';

import 'widgets/pokemons_view_body.dart';

class PokemonsView extends StatelessWidget {
  const PokemonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonsBloc(instance())..add(GetPokemonsEvent()),
      lazy: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pokemons'),
        ),
        body: const PokemonsViewBody(),
      ),
    );
  }
}
