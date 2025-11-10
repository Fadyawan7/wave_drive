import 'package:flutter/widgets.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class EmptyCommon extends StatelessWidget {
  const EmptyCommon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const AppImage(path: AppIcons.emptyBox, color: AppColors.gray),
          const Gap(12),
          Text(
            'Empty',
            style: AppTextStyles.text16.copyWith(color: AppColors.gray),
          ),
        ],
      ),
    );
  }
}

class EmptyCommonNew extends StatelessWidget {
  const EmptyCommonNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppImage(
            path: AppImages.followingbox,
            width: MediaQuery.sizeOf(context).width * .35,
          ),
          const Gap(12),
          Text(
            'Empty',
            style: AppTextStyles.text16.copyWith(color: AppColors.gray),
          ),
        ],
      ),
    );
  }
}
