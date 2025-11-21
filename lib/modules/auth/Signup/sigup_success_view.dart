import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/language_field/language_field.dart';
import 'package:wave_drive/modules/dashboad/dashboard_view.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();
         Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DashboardView()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Transform.scale(
              scale: _scaleAnimation.value,
              child: _buildSuccessContent(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSuccessContent() {
    return Column(
      children: [
        // Language Field
        const Padding(
          padding: EdgeInsets.only(top: 50, left: 24, right: 24),
          child: Align(alignment: Alignment.topRight, child: LanguageField()),
        ),
        // Centered content
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Success animation with error fallback
                  Container(
                    height: 147,
                    width: 167,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/success.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/animations/success.gif',
                              frameBuilder:
                                  (
                                    context,
                                    child,
                                    frame,
                                    wasSynchronouslyLoaded,
                                  ) {
                                    if (frame == null) {
                                      return const CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      );
                                    }
                                    return child;
                                  },
                              errorBuilder: (context, error, stackTrace) {
                                debugPrint('GIF error: $error');
                                return const Icon(
                                  Icons.check_circle,
                                  size: 60,
                                  color: Colors.white,
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(24),
                  Text('Success!', style: AppTextStyles.text12),
                  const Gap(16),
                  Text(
                    'Expect To Be Contacted By Wave In A\nFew Days.',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.text12,
                  ),
                  const Gap(150),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
