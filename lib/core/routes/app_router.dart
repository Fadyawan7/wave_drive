import 'package:auto_route/auto_route.dart';
// import 'package:wave_drive/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final int transitionDuration = 200;

  @override
  List<AutoRoute> get routes => [
    // CustomRoute(page: SplashRoute.page, path: '/'),
    // _fade(page: OnboardingWrapper.page, path: '/onboarding'),
  ];
  CustomRoute _fade({required PageInfo page, required String path}) =>
      CustomRoute(
        page: page,
        path: path,
        duration: Duration(milliseconds: transitionDuration),
        reverseDuration: Duration(milliseconds: transitionDuration),
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
}
