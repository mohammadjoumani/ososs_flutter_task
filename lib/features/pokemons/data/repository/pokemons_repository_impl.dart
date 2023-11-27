import 'package:dartz/dartz.dart';
import 'package:ososs_flutter_task/core/network/error_handler.dart';
import 'package:ososs_flutter_task/core/network/failure.dart';
import 'package:ososs_flutter_task/core/network/netword_info.dart';
import 'package:ososs_flutter_task/features/pokemons/data/data_source/pokemons_remote_data_source.dart';
import 'package:ososs_flutter_task/features/pokemons/data/models/dto/response/pokemon_response_dto.dart';
import 'package:ososs_flutter_task/features/pokemons/data/models/mapper/pokemon_mapper.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/entities/pokemon.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/repository/pokemons_repository.dart';

class PokemonsRepositoryImpl extends PokemonsRepository {
  final PokemonsRemoteDataSource _pokemonsRemoteDataSource;
  final NetworkInfo _networkInfo;

  PokemonsRepositoryImpl(this._pokemonsRemoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons(int pageNumber) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _pokemonsRemoteDataSource.getPokemons(pageNumber);
        return right(
            PokemonResponseDto.fromJsonList(response.results).toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
