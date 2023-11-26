import 'package:flutter/material.dart';

import 'widgets/pokemons_view_body.dart';

class PokemonsView extends StatelessWidget {
  const PokemonsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemons'),
      ),
      body: const PokemonsViewBody(),
    );
  }
}
