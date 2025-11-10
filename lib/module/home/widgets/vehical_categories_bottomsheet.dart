import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/rounded_button/rounded_button.dart';
// files
// components

class VehicalCategoriesBottomsheet extends StatefulWidget {
  const VehicalCategoriesBottomsheet({super.key});

  @override
  State<VehicalCategoriesBottomsheet> createState() =>
      _VehicalCategoriesBottomsheetState();
}

class _VehicalCategoriesBottomsheetState
    extends State<VehicalCategoriesBottomsheet> {
  // Mock list of options
  final List<String> options = ['Wave', 'Sedan', 'SUV', 'Mini'];

  int selectedIndex = -1; // Local selection state

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 5,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          Text(
            'Categories',
            textAlign: TextAlign.start,
            style: AppTextStyles.bodytext,
          ),
          const SizedBox(height: 10),
          // List of categories
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: options.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final isSelected = selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primarycolor,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: isSelected
                              ? Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: AppColors.primarycolor,
                                    shape: BoxShape.circle,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(options[index], style: AppTextStyles.bodytext1),
                    ],
                  ),
                ),
              );
            },
          ),
          const Gap(10),
          RoundedButton(
            title: 'Confirm',
            onpress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
