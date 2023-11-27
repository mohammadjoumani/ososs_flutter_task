import 'package:get_it/get_it.dart';
import 'package:ososs_flutter_task/core/app/di.dart';
import 'package:ososs_flutter_task/features/pokemons/data/data_source/pokemons_remote_data_source.dart';
import 'package:ososs_flutter_task/features/pokemons/data/repository/pokemons_repository_impl.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/repository/pokemons_repository.dart';
import 'package:ososs_flutter_task/features/pokemons/domain/use_cases/get_pokemons.dart';
import 'package:ososs_flutter_task/features/pokemons/presentation/bloc/pokemons_bloc.dart';

void initPokemonsModule() {
  if (!GetIt.I.isRegistered<GetPokemonsUseCase>()) {
    instance.registerLazySingleton<PokemonsRemoteDataSource>(
        () => PokemonsRemoteDataSourceImpl(instance()));
    instance.registerLazySingleton<PokemonsRepository>(
        () => PokemonsRepositoryImpl(instance(), instance()));
    instance.registerFactory<GetPokemonsUseCase>(
        () => GetPokemonsUseCase(instance()));
    instance.registerFactory<PokemonsBloc>(() => PokemonsBloc(instance()));
  }
}
