import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class VehicleSelectScreen extends StatefulWidget {
  const VehicleSelectScreen({super.key});

  @override
  State<VehicleSelectScreen> createState() => _VehicleSelectScreenState();
}

class _VehicleSelectScreenState extends State<VehicleSelectScreen> {
  final List<Map<String, String>> vehicles = [
    {
      'plate': 'EB53430',
      'model': 'Tesla Model 3 2020, Pearl White',
      'selected': 'true',
    },
    {
      'plate': 'EB34105',
      'model': 'Hyundai Ioniq Electric 2020, Silver',
      'selected': 'false',
    },
    {
      'plate': 'EB34105',
      'model': 'Hyundai Ioniq Electric 2020, Silver',
      'selected': 'false',
    },
    {
      'plate': 'EB34105',
      'model': 'Hyundai Ioniq Electric 2020, Silver',
      'selected': 'false',
    },
    {
      'plate': 'EB34105',
      'model': 'Hyundai Ioniq Electric 2020, Silver',
      'selected': 'false',
    },
    {
      'plate': 'EB34105',
      'model': 'Hyundai Ioniq Electric 2020, Silver',
      'selected': 'false',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
            'Vehicle',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          itemCount: vehicles.length,
          itemBuilder: (context, index) {
            final vehicle = vehicles[index];
            final isSelected = vehicle['selected'] == 'true';

            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      // Deselect all
                      for (var v in vehicles) {
                        v['selected'] = 'false';
                      }
                      // Select current
                      vehicle['selected'] = 'true';
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: AppColors.strockcolor,
                        ),
                      ),
                    ),

                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                vehicle['plate']!,
                                style: AppTextStyles.bodytext1.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                vehicle['model']!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Radio Button
                        Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primarycolor
                                  : AppColors.strockcolor,
                              width: 3,
                            ),
                            color: isSelected
                                ? AppColors.white
                                : Colors.transparent,
                          ),
                          child: isSelected
                              ? const Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: AppColors.primarycolor,
                                )
                              : null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
