import 'package:ososs_flutter_task/core/app/constants.dart';
import 'package:ososs_flutter_task/core/generic/dto/paging_list_dto.dart';
import 'package:ososs_flutter_task/core/network/api_service.dart';
import 'package:ososs_flutter_task/core/network/constants_api.dart';

abstract class PokemonsRemoteDataSource {
  Future<PagingListDto> getPokemons(int pageNumber);
}

class PokemonsRemoteDataSourceImpl extends PokemonsRemoteDataSource {
  final ApiService _apiService;

  PokemonsRemoteDataSourceImpl(this._apiService);

  @override
  Future<PagingListDto> getPokemons(int pageNumber) async {
    final response = await _apiService.get(
      url: ConstantsApi.getPokemons,
      params: {
        'limit': Constants.PAGE_SIZE,
        'offset': (pageNumber - 1) * Constants.PAGE_SIZE,
      },
    );
    return PagingListDto.fromJson(response);
  }
}
