import 'package:auto_route/auto_route.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
// import 'package:wave_drive/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final Duration transitionDuration = Duration(milliseconds: 200);

  @override
  List<AutoRoute> get routes => [
            CustomRoute(page: SplashRoute.page, path: '/'),

    // CustomRoute(page: SplashRoute.page, path: '/'),
    // _fade(page: OnboardingWrapper.page, path: '/onboarding'),
  ];
   CustomRoute _fade({required PageInfo page, required String path}) => CustomRoute(
        page: page,
        path: path,
        duration: transitionDuration,
        reverseDuration: transitionDuration,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );

  CustomRoute _slide({required PageInfo page, required String path}) => CustomRoute(
        page: page,
        path: path,
        duration: transitionDuration,
        reverseDuration: transitionDuration,
        transitionsBuilder: TransitionsBuilders.slideRight,
      );

  CustomRoute _change({required PageInfo page, required String path}) => CustomRoute(
        page: page,
        path: path,
        duration: Duration.zero,
        reverseDuration: Duration.zero,
      );
}
