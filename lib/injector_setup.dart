// ignore_for_file: always_use_package_imports

import 'package:get_it/get_it.dart';

// Services


// Repositories


final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector
    ..registerFactories()
    ..registerLazySingletons();
    // ..registerSingletons();
}

extension InjectorExtensions on GetIt {
  void registerFactories() {
    // Services
   // registerFactory<AuthRepository>(AuthRepository.new);
   
  
  }

  void registerLazySingletons() {
   // registerLazySingleton<MexcWebSocketService>(() => MexcWebSocketService());
   
  }
}
