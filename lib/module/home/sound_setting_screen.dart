import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class SoundSettingScreen extends StatefulWidget {
  const SoundSettingScreen({super.key});

  @override
  State<SoundSettingScreen> createState() => _SoundSettingScreenState();
}

class _SoundSettingScreenState extends State<SoundSettingScreen> {
  double volumeLevel = 0.6;
  String selectedSound = 'Bells'; // Default selected sound

  final List<Map<String, String>> soundOptions = [
    {'name': 'Bells', 'icon': '🔔'},
    {'name': 'Kalimbo', 'icon': '🎵'},
    {'name': 'Redor', 'icon': '📥'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Sound Setting',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Sound and volume section
              Text(
                'Sound and volume',
                style: AppTextStyles.bodytext1.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.blackcolor,
                ),
              ),

              // Incoming Request Sound section
              Row(
                children: [
                  Text(
                    'Incoming Request Sound',
                    style: AppTextStyles.bodytext1.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.blackcolor,
                    ),
                  ),
                  Spacer(),
                  Transform.scale(
                    scaleX: 0.7,
                    scaleY: 0.6,
                    child: Switch(
                      value: false,
                      onChanged: (bool value) {},
                      activeThumbColor: AppColors.white,
                      activeTrackColor: AppColors.primarycolor,
                      inactiveThumbColor: AppColors.primarycolor,
                      inactiveTrackColor: Colors.grey[300],
                    ),
                  ),
                ],
              ),
              Divider(color: AppColors.strockcolor, thickness: 1),

              // Volume Slider with icons
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 9),
                child: Row(
                  children: [
                    Icon(
                      Icons.volume_off_rounded,
                      color: AppColors.primarycolor,
                      size: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onHorizontalDragUpdate: (details) {
                            setState(() {
                              final RenderBox renderBox =
                                  context.findRenderObject() as RenderBox;
                              final localPosition = renderBox.globalToLocal(
                                details.globalPosition,
                              );
                              final newValue =
                                  (localPosition.dx - 36) /
                                  (renderBox.size.width - 92);
                              volumeLevel = newValue.clamp(0.0, 1.0);
                            });
                          },
                          child: Stack(
                            children: [
                              // Background bar
                              Container(
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: AppColors.liteprimarycolor,
                                ),
                              ),
                              // Active bar
                              Container(
                                width:
                                    MediaQuery.of(context).size.width *
                                    volumeLevel *
                                    0.6,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: AppColors.primarycolor,
                                ),
                              ),
                              // White thumb
                              Positioned(
                                left:
                                    (MediaQuery.of(context).size.width *
                                        volumeLevel *
                                        0.6) -
                                    3.5,
                                top: -0.5,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.volume_up,
                      color: AppColors.primarycolor,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Divider(color: AppColors.strockcolor, thickness: 1),
              const SizedBox(height: 8),
              // Sound options title
              Text(
                'Incoming Request Sound',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: AppColors.blackcolor,
                ),
              ),
              const SizedBox(height: 12),

              // Sound options list
              ...soundOptions.map((sound) {
                return _buildSoundOption(
                  name: sound['name']!,
                  isSelected: selectedSound == sound['name'],
                  onTap: () {
                    setState(() {
                      selectedSound = sound['name']!;
                    });
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSoundOption({
    required String name,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.bodytext1.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.blackcolor,
                    ),
                  ),
                  if (isSelected)
                    Icon(Icons.check, color: AppColors.primarycolor, size: 24)
                  else
                    Icon(Icons.download, color: Colors.grey[400], size: 20),
                ],
              ),
              SizedBox(height: 8),
              Divider(color: AppColors.strockcolor, thickness: 1),
            ],
          ),
        ),
      ),
    );
  }
}
