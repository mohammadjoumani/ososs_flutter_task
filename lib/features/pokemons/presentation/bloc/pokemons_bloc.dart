import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/entities/pokemon.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/use_cases/get_pokemons.dart';

part 'pokemons_event.dart';
part 'pokemons_state.dart';

class PokemonsBloc extends Bloc<PokemonsEvent, PokemonsState> {
  final GetPokemonsUseCase _getPokemonsUseCase;

  PokemonsBloc(this._getPokemonsUseCase) : super(PokemonsState()) {
    on<GetPokemonsEvent>(_mapGetPokemons);
    on<LoadMorePokemonsEvent>(_mapLoadMorePokemons);
  }

  _mapGetPokemons(GetPokemonsEvent event, Emitter<PokemonsState> emit) async {
    emit(state.copyWith(getPokemonsStatus: GetPokemonsStatus.loading));
    final result = await _getPokemonsUseCase(1);
    result.fold(
      (l) => emit(state.copyWith(
          getPokemonsStatus: GetPokemonsStatus.failure, message: l.message)),
      (r) {
        r.isEmpty
            ? emit(state.copyWith(getPokemonsStatus: GetPokemonsStatus.empty))
            : emit(
                state.copyWith(
                  getPokemonsStatus: GetPokemonsStatus.success,
                  pokemons: r,
                  pageNumber: 2,
                ),
              );
      },
    );
  }

  _mapLoadMorePokemons(
      LoadMorePokemonsEvent event, Emitter<PokemonsState> emit) async {
    emit(
        state.copyWith(loadMorePokemonsStatus: LoadMorePokemonsStatus.loading));
    final result = await _getPokemonsUseCase(state.pageNumber);
    result.fold(
      (l) => emit(
        state.copyWith(
          loadMorePokemonsStatus: LoadMorePokemonsStatus.failure,
          message: l.message,
        ),
      ),
      (r) {
        if (r.isEmpty) {
          emit(
            state.copyWith(
              loadMorePokemonsStatus: LoadMorePokemonsStatus.success,
              isDone: true,
            ),
          );
        } else {
          final newList = state.pokemons;
          newList.addAll(r);
          final newPageNumber = state.pageNumber + 1;
          emit(
            state.copyWith(
              loadMorePokemonsStatus: LoadMorePokemonsStatus.success,
              pokemons: newList,
              pageNumber: newPageNumber,
            ),
          );
        }
      },
    );
  }
}
