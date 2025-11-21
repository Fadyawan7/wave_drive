// ignore_for_file: always_use_package_imports

import 'package:get_it/get_it.dart';
import 'package:wave_drive/core/cubits/app_cubit.dart';
import 'package:wave_drive/core/routes/app_router.dart';

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
    // Services
    // registerFactory<AuthRepository>(AuthRepository.new);
  }

  void registerLazySingletons() {
    // registerLazySingleton<MexcWebSocketService>(() => MexcWebSocketService());
  }

  void registerSingletons() {
    registerSingleton<AppRouter>(AppRouter());
    registerSingleton<AppCubit>(AppCubit());
  }
}
