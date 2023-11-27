part of 'pokemons_bloc.dart';

@immutable
abstract class PokemonsEvent {}

class GetPokemonsEvent extends PokemonsEvent {}

class LoadMorePokemonsEvent extends PokemonsEvent {}
