import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/widgets/chart/trading_view_html.dart';

class TradingViewWidgetChart extends StatelessWidget {
  const TradingViewWidgetChart({required this.crypto, super.key});
  final String crypto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .59,
      child: Padding(
        padding: EdgeInsetsGeometry.only(top: 2),
        child: TradingViewWidgetHtml(cryptoName: crypto),
      ),
    );
  }
}
