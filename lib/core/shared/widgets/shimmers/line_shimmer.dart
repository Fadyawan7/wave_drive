import 'package:flutter/widgets.dart';
import 'package:wave_drive/core/shared/widgets/shimmers/base_shimmer.dart';

class LineShimmer extends StatelessWidget {
  const LineShimmer({super.key, this.height = 28, this.width = 80});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return BaseShimmer(width: width, height: height, radius: 20);
  }
}
