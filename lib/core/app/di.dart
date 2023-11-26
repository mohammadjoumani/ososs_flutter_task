import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ososs_flutter_task/core/network/api_service.dart';
import 'package:ososs_flutter_task/core/network/dio_factory.dart';
import 'package:ososs_flutter_task/core/network/netword_info.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // // SharedPreferences instance
  // final sharedPreferences = await SharedPreferences.getInstance();
  // instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // AppPreferences instance
  // final appPreferences = AppPreferences(instance());
  // instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  instance.registerLazySingleton<DioFactory>(() => DioFactory());

  final dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<ApiService>(() => ApiService(dio));

  // //Home RemoteDataSource instance
  // instance.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl(instance()));
  //
  // //Login Repository instance
  // instance.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(instance(), instance(), instance()));
  //
  // //Home LocalDataSource instance
  // // instance.registerLazySingleton<HomeLocalDataSource>(() => HomeLocalDataSourceImpl(instance()));
  //
  // //Home RemoteDataSource instance
  // instance.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(instance()));
  //
  // //Home Repository instance
  // instance.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(instance(), instance()));
  //
  // // Consultation Form
  // instance.registerSingleton<ConsultationRepository>(
  //   ConsultationRepositoryImpl(instance(), instance()),
  // );
  //
  // //Approved Services RemoteDataSource instance
  // instance.registerLazySingleton<ApprovedServicesRemoteDataSource>(() => ApprovedServicesRemoteDataSourceImpl(instance()));
  //
  // //Approved Services Repository instance
  // instance.registerLazySingleton<ApprovedServicesRepository>(() => ApprovedServicesRepositoryImpl(instance(), instance()));
}
