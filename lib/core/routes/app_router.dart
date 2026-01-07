import 'package:auto_route/auto_route.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/modules/auth/signup/signup_otp_screen.dart';
// import 'package:wave_drive/core/routes/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
   Duration transitionDuration = const Duration(milliseconds: 200);

  @override
  List<AutoRoute> get routes => [
            CustomRoute(page: SplashRoute.page, path: '/'),

    // CustomRoute(page: SplashRoute.page, path: '/'),
    _slide(page: SignupRoute.page, path: '/signup'),
    _slide(page: SignupOtpRoute.page, path: '/signup-otp'),
    _slide(page: LoginSignupRoute.page, path: '/login-signup'),
    _slide(page: LoginRoute.page, path: '/Login'),
    _slide(page: PersonelInfoRoute.page, path: '/personel-info'),
    _slide(page: LegalPriceRoute.page, path: '/legal-price'),
    _slide(page: PaymentDetailsRoute.page, path: '/payment-details'),
    _slide(page: RegisterDocRoute.page, path: '/register-doc'),
    _slide(page: SignupSuccessRoute.page, path: '/signup-success'),
    _slide(page: ProfileRoute.page, path: '/profile'),
    _slide(page: EarningRoute.page, path: '/earning'),
    _fade(page: DashboardRoute.page, path: '/dashboard'),
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
