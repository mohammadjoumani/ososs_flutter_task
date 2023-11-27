import 'package:dartz/dartz.dart';
import 'package:ososs_flutter_task/core/network/failure.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/entities/pokemon.dart';

abstract class PokemonsRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons(int pageNumber);
}
