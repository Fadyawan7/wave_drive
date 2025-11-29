import 'package:gap/gap.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/modules/dashboad/cubit/dashboard_cubit.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                color: AppColors.gray9E.withOpacity(0.25),
                offset: const Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    context,
                    path: AppIcons.home,
                    label: 'Home',
                    index: 0,
                    isActive: state.currentIndex == 0,
                  ),
                  _buildNavItem(
                    context,
                    path: AppIcons.category,
                    label: 'Earn more',
                    index: 1,
                    isActive: state.currentIndex == 1,
                  ),

                  _buildNavItem(
                    context,
                    path: AppIcons.clock,
                    label: 'Travels',
                    index: 2,
                    isActive: state.currentIndex == 2,
                  ),

                  _buildNavItem(
                    context,
                    path: AppIcons.help,
                    label: 'Help',
                    index: 3,
                    isActive: state.currentIndex == 3,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required String path,
    required String label,
    required int index,
    required bool isActive,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.read<DashboardCubit>().setCurrentIndex(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppImage(
              path: path,
              color: isActive ? AppColors.primary : AppColors.grayCF,
            ),
            const Gap(4),
            Text(
              label,
              style: AppTextStyles.text12.copyWith(
                color: isActive ? AppColors.primary : AppColors.grayCF,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
