import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/modules/setting/widgets/auto_accept_toggle_item.dart';

class AutoAcceptScreen extends StatefulWidget {
  const AutoAcceptScreen({super.key});

  @override
  State<AutoAcceptScreen> createState() => _AutoAcceptScreenState();
}

class _AutoAcceptScreenState extends State<AutoAcceptScreen> {
  bool _autoAcceptEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Auto-Accept",
        leadingColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(24),
              AutoAcceptToggleItem(
                title: 'Auto Accept',
                value: _autoAcceptEnabled,
                onChanged: (value) {
                  setState(() {
                    _autoAcceptEnabled = value;
                  });
                },
              ),
              const Gap(16),
              Text(
                'When enabled, incoming ride requests are automatically accepted, unless they are optional (e.g. outside your radius). Auto-Accept feature will be disabled when you decline, cancel or miss a ride request.',
                style: AppTextStyles.text14.copyWith(
                  color: AppColors.grayA9,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
