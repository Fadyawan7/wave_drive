import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';

class DriverCategoryWidget extends StatelessWidget {

  DriverCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Color(0xFFF8F8F8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(12),
                    dropdownColor: AppColors.whitecolor,
                    isExpanded: true,
                    value: 'selectedCategory',
                    // controller.selectedCategory.value.isEmpty
                    //     ? null
                    //     : controller.selectedCategory.value,
                    hint: Text("Select as",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                    items: [],
                    // controller.categories.map((String city) {
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
                    icon: SizedBox.shrink(),
                  ),
                ),
              ),
              //if (controller.selectedCategory.value.isNotEmpty)
                GestureDetector(
                  onTap:() {
                    
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
