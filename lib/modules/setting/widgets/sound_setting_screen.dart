import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/modules/setting/widgets/auto_accept_toggle_item.dart';
import 'package:wave_drive/modules/setting/widgets/sound_option_item.dart';

class SoundSettingScreen extends StatefulWidget {
  const SoundSettingScreen({super.key});

  @override
  State<SoundSettingScreen> createState() => _SoundSettingScreenState();
}

class _SoundSettingScreenState extends State<SoundSettingScreen> {
  bool _incomingRequestSoundEnabled = true;
  double _volumeValue = 0.75;
  String _selectedSound = 'Bells';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Sound Setting",
        leadingColor: AppColors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(24),
              // Sound and volume section
              Text(
                'Sound and volume',
                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const Gap(16),
              AutoAcceptToggleItem(
                title: 'Incoming Request Sound',
                value: _incomingRequestSoundEnabled,
                onChanged: (value) {
                  setState(() {
                    _incomingRequestSoundEnabled = value;
                  });
                },
              ),
              const Gap(16),
              // Volume slider
              Row(
                children: [
                  const Icon(
                    Icons.volume_off,
                    size: 20,
                    color: AppColors.grayA9,
                  ),
                  const Gap(12),
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: AppColors.primarycolor,
                        inactiveTrackColor: AppColors.grayE3,
                        thumbColor: AppColors.white,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 8,
                          elevation: 2,
                        ),
                        overlayShape: const RoundSliderOverlayShape(
                          overlayRadius: 16,
                        ),
                        trackHeight: 4,
                      ),
                      child: Slider(
                        value: _volumeValue,
                        onChanged: (value) {
                          setState(() {
                            _volumeValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  const Gap(12),
                  const Icon(
                    Icons.volume_up,
                    size: 20,
                    color: AppColors.grayA9,
                  ),
                ],
              ),
              const Gap(32),
              // Incoming Request Sound selection section
              Text(
                'Incoming Request Sound',
                style: AppTextStyles.text18.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const Gap(16),
              SoundOptionItem(
                title: 'Bells',
                isSelected: _selectedSound == 'Bells',
                onTap: () {
                  setState(() {
                    _selectedSound = 'Bells';
                  });
                },
              ),
              SoundOptionItem(
                title: 'Kalimba',
                isSelected: _selectedSound == 'Kalimba',
                showDownloadIcon: true,
                onTap: () {
                  // TODO: Handle download
                },
              ),
              SoundOptionItem(
                title: 'Redar',
                isSelected: _selectedSound == 'Redar',
                showDownloadIcon: true,
                onTap: () {
                  // TODO: Handle download
                },
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
