import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/routes/routes.dart';

import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/bottom_sheet/default_bottom_sheet.dart';
import 'package:wave_drive/core/shared/widgets/buttons/primary_button.dart';

List<String> _categoriesList = ["Wave", "Comfort", "Premium", "Electric", "XL"];

class CategoryBotonSheet {
  static Future<String?> show(
    BuildContext context, {
    bool barrierDismissible = true,
  }) async {
    int selectedIndex = 0;

    return DefaultBottomSheet.show<String>(
      boarder: 12,
      context,
      barrierDismissible: barrierDismissible,
      showDivider: false,
      child: StatefulBuilder(
        builder: (context, setSheetState) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Categories",
                    style: AppTextStyles.text20.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black33,
                    ),
                  ),
                  const Gap(12),

                  /// Build list of radio items
                  ...List.generate(
                    _categoriesList.length,
                    (index) => _buildItem(
                      title: _categoriesList[index],
                      isSelected: selectedIndex == index,
                      showDivider: index != _categoriesList.length - 1,
                      onTap: (_) {
                        setSheetState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),

                  const Gap(30),
                  PrimaryButton(
                    text: "Confirm",
                    onPressed: () => AppNavigator.pop(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  static Widget _buildItem({
    required String title,
    required bool isSelected,
    bool showDivider = true,
    required Function(String title) onTap,
  }) {
    return InkWell(
      onTap: () => onTap(title),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                customRadio(isSelected),
                const Gap(12),
                Text(
                  title,
                  style: AppTextStyles.text16.copyWith(
                    color: AppColors.black33,
                  ),
                ),
              ],
            ),

            if (showDivider)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Divider(thickness: 0.3, color: AppColors.grayA9),
              ),
          ],
        ),
      ),
    );
  }
}

Widget customRadio(bool isSelected) {
  return Container(
    width: 20,
    height: 20,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: AppColors.primary, width: 2),
      color: isSelected
          ? AppColors.primary.withOpacity(0.2)
          : Colors.transparent,
    ),
    child: isSelected
        ? Center(
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          )
        : null,
  );
}
