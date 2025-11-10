import 'package:wave_drive/core/data/local/secure_storage_helper.dart';
import 'package:dio/dio.dart';

class AuthInterceptor implements Interceptor {
  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final token = await SecureStorageHelper.getSavedAccessToken();
      if (token != null) {
        // injector<AuthCubit>().logOut();
        // if (injector<AppRouter>().currentPath != SignInPhoneRoute.name &&
        //     injector<AppRouter>().currentPath != SplashRoute.name) {
        //   if (injector<MainScreenCubit>().pageController.hasClients) {
        //     injector<MainScreenCubit>().onChangePage(0);
        //   }

        //   injector<AppRouter>().replaceAll([
        //     const MainRoute(),
        //     const SignInRoute(),
        //   ]);
        // }
      }
    }
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
