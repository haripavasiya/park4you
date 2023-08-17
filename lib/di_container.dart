import 'package:car_share/utill/preferenceutils.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasource/remote/dio/dio_client.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';
import 'data/repository/home_repo.dart';
import 'provider/otp_provider.dart';
import 'provider/splash_provider.dart';
import 'provider/theme_provider.dart';
import 'utill/app_constants.dart';

final sl = GetIt.instance;

Future<void> init() async {

  //Repo
  sl.registerLazySingleton(() => DioClient(AppConstants.baseURL, sl(), loggingInterceptor: sl()));
  sl.registerLazySingleton(() => Home_Repo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => SplashProvider());
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => OTPProvider());

  // External
  PreferenceUtils.init();
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
