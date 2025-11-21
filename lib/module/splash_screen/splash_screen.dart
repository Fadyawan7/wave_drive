import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/module/auth/Login/login_view.dart';
import 'package:wave_drive/module/auth/Signup/signup_view.dart';
import 'package:wave_drive/module/auth/login_signup_view.dart';
import 'package:wave_drive/module/dashboad/dashboard_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginSignupView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Image.asset('assets/images/driverLogo.png'),
        ),
      ),
    );
  }
}
