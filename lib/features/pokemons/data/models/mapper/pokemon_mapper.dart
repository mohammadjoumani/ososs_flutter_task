import 'package:ososs_flutter_task/core/app/constants.dart';
import 'package:ososs_flutter_task/core/network/constants_api.dart';
import 'package:ososs_flutter_task/features/pokemons/data/models/dto/response/pokemon_response_dto.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/entities/pokemon.dart';

extension PokemonMapper on PokemonResponseDto {
  Pokemon toDomain() {
    return Pokemon(name ?? Constants.empty, url ?? Constants.empty,
        ConstantsApi.pokemonImage);
  }
}

extension ListPokemonMapper on List<PokemonResponseDto> {
  List<Pokemon> toDomain() {
    return map((e) => e.toDomain()).toList();
  }
}
