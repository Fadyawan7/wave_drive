import 'package:flutter/widgets.dart';
import 'package:wave_drive/core/shared/widgets/shimmers/base_shimmer.dart';

class SquareListShimmer extends StatelessWidget {
  final int? number;
  final double? height;
  const SquareListShimmer({super.key, this.number, this.height});

  @override
  Widget build(BuildContext context) {
    // final width = (MediaQuery.of(context).size.width - 50 - 8 * 2) / 3;
    final width = (MediaQuery.of(context).size.width - 50 - 18 * 2) / 3;

    return Wrap(
      runSpacing: 8,
      spacing: 8,
      children: List.generate(
        number ?? 6,
        (index) => BaseShimmer(
          width: width,
          height: height ?? 95,
          radius: 8,
          millisecondsDelay: 300 * index,
        ),
      ),
    );
  }
}
