part of 'pokemons_bloc.dart';

enum GetPokemonsStatus { initial, loading, empty, success, failure }

enum LoadMorePokemonsStatus { initial, loading, success, failure }

class PokemonsState {
  final GetPokemonsStatus getPokemonsStatus;
  final LoadMorePokemonsStatus loadMorePokemonsStatus;
  final List<Pokemon> pokemons;
  final int pageNumber;
  final bool isDone;
  final String message;

  PokemonsState({
    this.getPokemonsStatus = GetPokemonsStatus.initial,
    this.loadMorePokemonsStatus = LoadMorePokemonsStatus.initial,
    this.pokemons = const [],
    this.pageNumber = 1,
    this.isDone = false,
    this.message = '',
  });

  PokemonsState copyWith({
    GetPokemonsStatus? getPokemonsStatus,
    LoadMorePokemonsStatus? loadMorePokemonsStatus,
    List<Pokemon>? pokemons,
    int? pageNumber,
    bool? isDone,
    String? message,
  }) {
    return PokemonsState(
      getPokemonsStatus: getPokemonsStatus ?? this.getPokemonsStatus,
      loadMorePokemonsStatus:
          loadMorePokemonsStatus ?? this.loadMorePokemonsStatus,
      pokemons: pokemons ?? this.pokemons,
      pageNumber: pageNumber ?? this.pageNumber,
      isDone: isDone ?? this.isDone,
      message: message ?? this.message,
    );
  }
}
