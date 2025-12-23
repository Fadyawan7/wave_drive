// ignore_for_file: always_use_package_imports

import 'package:get_it/get_it.dart';
import 'package:wave_drive/core/cubits/app_cubit.dart';
import 'package:wave_drive/core/cubits/auth/auth_cubit.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/data/network/api_service.dart';
import 'package:wave_drive/core/data/network/dio/dio_providers.dart';
import 'package:wave_drive/core/data/repositories/auth_repository.dart';
import 'package:wave_drive/core/data/repositories/user_repository.dart';
import 'package:wave_drive/core/routes/app_router.dart';
import 'package:wave_drive/core/services/firebase/authenticate/apple_auth_service.dart';
import 'package:wave_drive/core/services/firebase/authenticate/google_auth_service.dart';
import 'package:wave_drive/core/services/firebase/authenticate/phone_auth_service.dart';
import 'package:wave_drive/core/services/firebase/firebase_auth_service.dart';
import 'package:wave_drive/core/services/location_service.dart';
import 'package:wave_drive/core/services/permission_handler_service.dart';
import 'package:wave_drive/modules/auth/signup/cubit/signup_cubit.dart';
import 'package:wave_drive/modules/dashboad/cubit/dashboard_cubit.dart';

// Services

// Repositories

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector
    ..registerFactories()
    ..registerLazySingletons()
    ..registerSingletons();
}

extension InjectorExtensions on GetIt {
  void registerFactories() {
       registerFactory<PermissionHandlerService>(PermissionHandlerService.new);


 registerFactory<UserRepository>(UserRepository.new);
    registerFactory<AuthRepository>(AuthRepository.new);
    registerFactory<GoogleAuthService>(GoogleAuthService.new);
    registerFactory<AppleAuthService>(AppleAuthService.new);

  }

  void registerLazySingletons() {
         registerLazySingleton<LocationService>(() => LocationService
     ());
    registerLazySingleton<UserCubit>(() => UserCubit());
        registerLazySingleton<PhoneAuthService>(() => PhoneAuthService());


    registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  //  registerLazySingleton<GooglePlacesService>(() => GooglePlacesService());
    registerLazySingleton<SignupCubit>(() => SignupCubit());
  }

  void registerSingletons() {
        registerSingleton<AppRouter>(AppRouter());

        registerSingleton<DioProvider>(DioProvider());
            registerSingleton<ApiService>(ApiService(get<DioProvider>().getInstance()));

    registerSingleton<AuthCubit>(AuthCubit());

    registerSingleton<AppCubit>(AppCubit());
        registerSingleton<DashboardCubit>(DashboardCubit());

  }
}
