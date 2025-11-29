import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

/// A reusable tab bar widget with custom selection style
/// Selected tab: White rectangular button with shadow
/// Unselected tab: Plain black text on grey background
class CustomSelectionTabBar extends StatelessWidget {
  const CustomSelectionTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onTabChanged,
    this.labelStyle,
    this.unselectedLabelStyle,
  });

  final List<String> tabs;
  final int selectedIndex;
  final Function(int index) onTabChanged;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: AppColors.grayF8,
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = index == selectedIndex;
          return Expanded(
            child: GestureDetector(
              onTap: () => onTabChanged(index),
              behavior: HitTestBehavior.opaque,
              child: isSelected
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          tabs[index],
                          style:
                              labelStyle ??
                              AppTextStyles.textMed13.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Center(
                        child: Text(
                          tabs[index],
                          style:
                              unselectedLabelStyle ??
                              AppTextStyles.textMed13.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.black,
                              ),
                        ),
                      ),
                    ),
            ),
          );
        }),
      ),
    );
  }
}
