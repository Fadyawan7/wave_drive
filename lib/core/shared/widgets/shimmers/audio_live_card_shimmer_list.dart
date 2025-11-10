import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/widgets/shimmers/base_shimmer.dart';

class AudioLiveCardShimmerList extends StatelessWidget {
  const AudioLiveCardShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: List.generate(6, (index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: BaseShimmer(
            highlightColor: AppColors.gray.withOpacity(0.5),
            baseColor: AppColors.gray.withOpacity(0.3),
            millisecondsDelay: index * 200,
            width: screenWidth,
            height: 130,
            radius: 16,
          ),
        );
      }),
    );
  }
}
