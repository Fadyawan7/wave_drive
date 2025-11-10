import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/shimmers/base_shimmer.dart';

class UserActionsShimmer extends StatelessWidget {
  const UserActionsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        6,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Row(
            children: [
              BaseShimmer.round(millisecondsDelay: index * 1000, size: 48),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseShimmer(
                      millisecondsDelay: index * 300,
                      width: 100,
                      height: 14,
                      radius: 8,
                    ),
                    const Gap(8),
                    BaseShimmer(
                      width: 140,
                      height: 14,
                      radius: 8,
                      millisecondsDelay: index * 300,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
