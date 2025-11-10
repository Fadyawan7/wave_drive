import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/widgets/shimmers/base_shimmer.dart';

/// Reusable shimmer skeleton for Trading Detail Screen
class TradingDetailShimmer extends StatelessWidget {
  const TradingDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          // Price and Stats Section Skeleton
          _PriceStatsShimmer(),
          const Gap(16),
          // Chart Section Skeleton
          _ChartSectionShimmer(),
          const Gap(16),
          // Depth Chart Section Skeleton
          _DepthChartShimmer(),
          const Gap(12),
          // Order Book Header Skeleton
          _OrderBookHeaderShimmer(),
          const Gap(8),
          // Order Book List Skeleton
          _OrderBookListShimmer(),
        ],
      ),
    );
  }
}

/// Price and Stats Section Shimmer
class _PriceStatsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = constraints.maxWidth;
          final leftSectionWidth =
              (screenWidth - 24 - 16) * 0.5; // 50% minus padding and gap

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Price and Change
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BaseShimmer(
                      width: (leftSectionWidth * 0.85).clamp(120.0, 200.0),
                      height: 40,
                      radius: 8,
                      fadeTheme: FadeTheme.dark,
                    ),
                    const Gap(8),
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: BaseShimmer(
                              width: (leftSectionWidth * 0.5).clamp(
                                60.0,
                                120.0,
                              ),
                              height: 16,
                              radius: 4,
                              fadeTheme: FadeTheme.dark,
                            ),
                          ),
                          const Gap(8),
                          Flexible(
                            child: BaseShimmer(
                              width: (leftSectionWidth * 0.3).clamp(40.0, 80.0),
                              height: 16,
                              radius: 4,
                              fadeTheme: FadeTheme.dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(16),
              // Right: 24H Stats
              Expanded(
                flex: 3,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final columnWidth = constraints.maxWidth * 0.45;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BaseShimmer(
                                width: columnWidth.clamp(50.0, 70.0),
                                height: 14,
                                radius: 4,
                                fadeTheme: FadeTheme.dark,
                              ),
                              const Gap(4),
                              BaseShimmer(
                                width: (columnWidth * 1.1).clamp(55.0, 80.0),
                                height: 14,
                                radius: 4,
                                fadeTheme: FadeTheme.dark,
                              ),
                              const Gap(10),
                              BaseShimmer(
                                width: columnWidth.clamp(50.0, 70.0),
                                height: 14,
                                radius: 4,
                                fadeTheme: FadeTheme.dark,
                              ),
                              const Gap(4),
                              BaseShimmer(
                                width: (columnWidth * 1.1).clamp(55.0, 80.0),
                                height: 14,
                                radius: 4,
                                fadeTheme: FadeTheme.dark,
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              BaseShimmer(
                                width: columnWidth.clamp(50.0, 70.0),
                                height: 14,
                                radius: 4,
                                fadeTheme: FadeTheme.dark,
                              ),
                              const Gap(4),
                              BaseShimmer(
                                width: (columnWidth * 1.15).clamp(55.0, 85.0),
                                height: 14,
                                radius: 4,
                                fadeTheme: FadeTheme.dark,
                              ),
                              const Gap(10),
                              BaseShimmer(
                                width: (columnWidth * 1.15).clamp(55.0, 85.0),
                                height: 14,
                                radius: 4,
                                fadeTheme: FadeTheme.dark,
                              ),
                              const Gap(4),
                              BaseShimmer(
                                width: (columnWidth * 1.25).clamp(60.0, 90.0),
                                height: 14,
                                radius: 4,
                                fadeTheme: FadeTheme.dark,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Chart Section Shimmer
class _ChartSectionShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: BaseShimmer(
        width: double.infinity,
        height: 300,
        radius: 8,
        fadeTheme: FadeTheme.dark,
      ),
    );
  }
}

/// Depth Chart Section Shimmer
class _DepthChartShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
          color: AppColors.black.withOpacity(0.3),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Legend
            Row(
              children: [
                BaseShimmer(
                  width: 40,
                  height: 12,
                  radius: 2,
                  fadeTheme: FadeTheme.dark,
                ),
                const Gap(16),
                BaseShimmer(
                  width: 40,
                  height: 12,
                  radius: 2,
                  fadeTheme: FadeTheme.dark,
                ),
              ],
            ),
            const Gap(8),
            // Chart area
            Expanded(
              child: BaseShimmer(
                width: double.infinity,
                height: 150,
                radius: 4,
                fadeTheme: FadeTheme.dark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Order Book Header Shimmer
class _OrderBookHeaderShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: BaseShimmer(
              width: 60,
              height: 14,
              radius: 4,
              fadeTheme: FadeTheme.dark,
            ),
          ),
          Expanded(
            child: Center(
              child: BaseShimmer(
                width: 40,
                height: 14,
                radius: 4,
                fadeTheme: FadeTheme.dark,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: BaseShimmer(
                width: 60,
                height: 14,
                radius: 4,
                fadeTheme: FadeTheme.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Order Book List Shimmer
class _OrderBookListShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: List.generate(10, (index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Row(
              children: [
                // Bid side
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseShimmer(
                        width: 70,
                        height: 14,
                        radius: 4,
                        fadeTheme: FadeTheme.dark,
                        millisecondsDelay: index * 50,
                      ),
                      BaseShimmer(
                        width: 60,
                        height: 14,
                        radius: 4,
                        fadeTheme: FadeTheme.dark,
                        millisecondsDelay: index * 50 + 25,
                      ),
                    ],
                  ),
                ),
                const Gap(12),
                // Center divider
                Container(width: 1, height: 20, color: Colors.transparent),
                const Gap(12),
                // Ask side
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BaseShimmer(
                        width: 60,
                        height: 14,
                        radius: 4,
                        fadeTheme: FadeTheme.dark,
                        millisecondsDelay: index * 50 + 50,
                      ),
                      BaseShimmer(
                        width: 70,
                        height: 14,
                        radius: 4,
                        fadeTheme: FadeTheme.dark,
                        millisecondsDelay: index * 50 + 75,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
