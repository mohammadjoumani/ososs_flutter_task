import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ososs_flutter_task/core/network/api_service.dart';
import 'package:ososs_flutter_task/core/network/dio_factory.dart';
import 'package:ososs_flutter_task/core/network/netword_info.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<ApiService>(() => ApiService(dio));
}
