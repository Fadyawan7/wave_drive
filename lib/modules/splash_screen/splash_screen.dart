import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/cubits/app_cubit.dart';
import 'package:wave_drive/core/cubits/socket/socket_cubit.dart';
import 'package:wave_drive/core/cubits/user/user_cubit.dart';
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/routes/app_router.gr.dart';
import 'package:wave_drive/core/services/permission_handler_service.dart';

import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/request_permission_dialog.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/injector_setup.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  final _appCubit = injector<AppCubit>();

  final _socketCubit = injector<SocketCubit>();

  late AnimationController animationController;
  late Animation<double> handAnimation;

  late AnimationController initialScaleController;
  late Animation<double> initialScaleAnimation;

  @override
  void initState() {
    initialScaleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    initialScaleAnimation = Tween<double>(begin: 3.0, end: 1.0).animate(
      CurvedAnimation(parent: initialScaleController, curve: Curves.easeInOut),
    );

    initialScaleController.forward();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    handAnimation = Tween<double>(begin: -0.2, end: 0.2).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    _openAppFlow();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    initialScaleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  AppImage(path: AppIcons.waveLogo),
                  AnimatedBuilder(
                    animation: initialScaleController,
                    builder: (context, child) {
                      // Calculate dimensions based on screen size
                      final double baseImageHeight =
                          screenSize.height * 0.1; // ~10% of screen height
                      final double imageHeight =
                          baseImageHeight * initialScaleAnimation.value;

                      // Calculate offsets as percentages of screen size
                      final double offsetX =
                          (1 - initialScaleAnimation.value) *
                          screenSize.width *
                          0.1;
                      final double offsetY =
                          (1 - initialScaleAnimation.value) *
                          screenSize.height *
                          0.1;

                      return Positioned(
                        right:
                            screenSize.width * 0.08 +
                            offsetX, // ~8% of screen width
                        top:
                            screenSize.height * 0.02 +
                            offsetY, // ~2% of screen height
                        child: Transform.scale(
                          scale: initialScaleAnimation.value,
                          child: AnimatedBuilder(
                            animation: handAnimation,
                            builder: (context, child) {
                              return Transform.rotate(
                                angle: handAnimation.value,
                                origin: Offset(
                                  0,
                                  -screenSize.height * 0.015,
                                ), // ~1.5% of screen height
                                child: AppImage(
                                  path: AppIcons.animateLogo,
                                  height: imageHeight,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openAppFlow() async {

    await _appCubit.initDioProvider();
    await _appCubit.initializeApp();
    await _socketCubit.init();

    
    _navigate();

  }

  Future<void> _navigate() async {
    final userCubit = injector<UserCubit>();

    if (userCubit.state.isLoggedIn) {
      AppNavigator.replaceAll(context, const DashboardRoute());
    } else {
      AppNavigator.replaceAll(context, const LoginSignupRoute());
    }
  }


}
