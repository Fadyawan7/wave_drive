import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/modules/dashboad/dashboard_view.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
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
      CurvedAnimation(
        parent: initialScaleController,
        curve: Curves.easeInOut,
      ),
    );

    initialScaleController.forward();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    handAnimation = Tween<double>(begin: -0.2, end: 0.2).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 2), () {
      animationController.stop();
    //  AppNavigator.replaceAll(context, SignupRoute());//
     Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardView(),));
    });

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
                      double baseImageHeight =
                          screenSize.height * 0.1; // ~10% of screen height
                      double imageHeight =
                          baseImageHeight * initialScaleAnimation.value;

                      // Calculate offsets as percentages of screen size
                      double offsetX = (1 - initialScaleAnimation.value) *
                          screenSize.width *
                          0.1;
                      double offsetY = (1 - initialScaleAnimation.value) *
                          screenSize.height *
                          0.1;

                      return Positioned(
                        right: screenSize.width * 0.08 +
                            offsetX, // ~8% of screen width
                        top: screenSize.height * 0.02 +
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
                                      -screenSize.height *
                                          0.015), // ~1.5% of screen height
                                  child: AppImage(
                                    path: AppIcons.animateLogo,
                                    height: imageHeight,
                                  ));
                            },
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
