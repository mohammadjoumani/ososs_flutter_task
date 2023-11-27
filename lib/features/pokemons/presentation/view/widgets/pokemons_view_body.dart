import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs_flutter_task/core/utils/widgets/generic_failure_message.dart';
import 'package:ososs_flutter_task/features/pokemons/presentation/bloc/pokemons_bloc.dart';

import 'pagination_list.dart';

class PokemonsViewBody extends StatelessWidget {
  const PokemonsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonsBloc, PokemonsState>(
      builder: (context, state) {
        switch (state.getPokemonsStatus) {
          case GetPokemonsStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case GetPokemonsStatus.success:
            return PaginationList(pokemons: state.pokemons);
          case GetPokemonsStatus.empty:
            return const Center(child: Text("Empty data"));
          case GetPokemonsStatus.failure:
            return Center(
              child: GenericFailureMessage(
                message: state.message,
                onPressed: () {
                  BlocProvider.of<PokemonsBloc>(context)
                      .add(GetPokemonsEvent());
                },
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
