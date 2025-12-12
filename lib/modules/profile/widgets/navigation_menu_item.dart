import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';

class NavigationMenuItem extends StatelessWidget {
  const NavigationMenuItem({
    super.key,
    required this.title,
    this.onTap,
    this.showChevron = true,
    this.showToggle = false,
    this.toggleValue = false,
    this.onToggleChanged,
  });

  final String title;
  final VoidCallback? onTap;
  final bool showChevron;
  final bool showToggle;
  final bool toggleValue;
  final ValueChanged<bool>? onToggleChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: showToggle ? null : onTap,
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.text16.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                ),
                if (showToggle) ...[
                  const Gap(12),
                  GestureDetector(
                    onTap: () {
                      onToggleChanged?.call(!toggleValue);
                    },
                    child: Container(
                      width: 51,
                      height: 31,
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: toggleValue
                            ? AppColors.primarycolor
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(15.5),
                        border: Border.all(
                          color: toggleValue
                              ? AppColors.primarycolor
                              : AppColors.grayE3,
                          width: 1,
                        ),
                      ),
                      alignment: toggleValue
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          color: toggleValue
                              ? AppColors.white
                              : AppColors.grayE3,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ] else if (showChevron) ...[
                  const Gap(12),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                    color: AppColors.black1F,
                  ),
                ],
              ],
            ),
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: AppColors.grayF8,
        ),
      ],
    );
  }
}

