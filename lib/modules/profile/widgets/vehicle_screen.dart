import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/modules/profile/widgets/vehicle_list_item.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({super.key});

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  int? _selectedVehicleIndex;

  final List<Map<String, String>> _vehicles = [
    {
      'id': 'EB53430',
      'description': 'Tesla Model 3 2020, Pearl White',
    },
    {
      'id': 'EB34105',
      'description': 'Hyundai Ioniq Electric 2020, Silver',
    },
    {
      'id': 'EB34105',
      'description': 'Hyundai Ioniq Electric 2020, Silver',
    },
    {
      'id': 'EB34105',
      'description': 'Hyundai Ioniq Electric 2020, Silver',
    },
    {
      'id': 'EB34105',
      'description': 'Hyundai Ioniq Electric 2020, Silver',
    },
    {
      'id': 'EB34105',
      'description': 'Hyundai Ioniq Electric 2020, Silver',
    },
  ];

  @override
  void initState() {
    super.initState();
    // Set first vehicle as selected by default
    _selectedVehicleIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Vehicle",
        leadingColor: AppColors.black,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 24, bottom: 30),
              itemCount: _vehicles.length,
              itemBuilder: (context, index) {
                final vehicle = _vehicles[index];
                final vehicleId = vehicle['id']!;
                final isSelected = _selectedVehicleIndex == index;
                
                return VehicleListItem(
                  vehicleId: vehicleId,
                  vehicleDescription: vehicle['description']!,
                  isSelected: isSelected,
                  uniqueValue: index.toString(),
                  onTap: () {
                    setState(() {
                      _selectedVehicleIndex = index;
                    });
                  },
                );
              },
            ),
          ),
          // Floating status badge
          Positioned(
            right: 16,
            top: MediaQuery.of(context).size.height * 0.4,
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: AppColors.primarycolor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  'S',
                  style: AppTextStyles.text18.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
