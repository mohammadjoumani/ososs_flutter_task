import 'package:dartz/dartz.dart';
import 'package:ososs_flutter_task/core/generic/use_case/use_case.dart';
import 'package:ososs_flutter_task/core/network/failure.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/entities/pokemon.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/repository/pokemons_repository.dart';

class GetPokemonsUseCase extends BaseUseCase<int, List<Pokemon>> {
  final PokemonsRepository _pokemonsRepository;

  GetPokemonsUseCase(this._pokemonsRepository);

  @override
  Future<Either<Failure, List<Pokemon>>> call(int input) {
    return _pokemonsRepository.getPokemons(input);
  }
}
