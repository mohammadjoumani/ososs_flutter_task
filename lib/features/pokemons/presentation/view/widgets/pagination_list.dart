import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ososs_flutter_task/core/utils/resource/values_manager.dart';
import 'package:ososs_flutter_task/core/utils/widgets/generic_failure_message.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/entities/pokemon.dart';
import 'package:ososs_flutter_task/features/pokemons/presentation/bloc/pokemons_bloc.dart';

import 'item_pokemon.dart';

class PaginationList extends StatelessWidget {
  const PaginationList({super.key, required this.pokemons});

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
      onNotification: (scrollInfo) {
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                BlocProvider.of<PokemonsBloc>(context).state.isDone == false
            ? BlocProvider.of<PokemonsBloc>(context)
                .add(LoadMorePokemonsEvent())
            : null;
        return true;
      },
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  ItemPokemon(index: index, pokemon: pokemons[index]),
              itemCount: pokemons.length,
              padding: const EdgeInsets.all(AppPadding.p16),
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: AppPadding.p16),
            ),
          ),
          BlocBuilder<PokemonsBloc, PokemonsState>(
            builder: (context, state) {
              switch (state.loadMorePokemonsStatus) {
                case LoadMorePokemonsStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case LoadMorePokemonsStatus.success:
                  return const SizedBox();
                case LoadMorePokemonsStatus.failure:
                  return GenericFailureMessage(
                    message: state.message,
                    onPressed: () {
                      BlocProvider.of<PokemonsBloc>(context)
                          .add(LoadMorePokemonsEvent());
                    },
                  );
                default:
                  return const SizedBox();
              }
            },
          )
        ],
      ),
    );
  }
}
