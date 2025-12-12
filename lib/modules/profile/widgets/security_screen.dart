import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({super.key});

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MainAppBar(title: "Security", leadingColor: AppColors.black),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(24),
            ],
          ),
        ),
      ),
    );
  }
}

