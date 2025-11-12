import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class CityDropdown extends StatelessWidget {
  // final SignupPhoneController controller = Get.put(SignupPhoneController());

  CityDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Color(0xFFF8F8F8), // Light background like the image
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: AppColors.whitecolor,
                  isExpanded: true,
                  value: 'selectedCity',
                  // controller.selectedCity.value.isEmpty
                  //     ? null
                  //     : controller.selectedCity.value,
                  hint: Text("Select City",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400)),
                  items:[], 
                  // controller.swedenCities.map((String city) {
                  //   return DropdownMenuItem<String>(
                  //     value: city,
                  //     child: Text(city),
                  //   );
                  // }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
// controller.setCity(newValue);
                    }
                  },
                  icon: SizedBox.shrink(), // Remove default dropdown icon
                ),
              ),
            ),
            //if (controller.selectedCity.value.isNotEmpty)
              GestureDetector(
                onTap: () {
                  
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.clear, size: 18),
                ),
              ),
            Icon(Icons.keyboard_arrow_down, size: 22),
          ],
        ),
      );
  }
}
