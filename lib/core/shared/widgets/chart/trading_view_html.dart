import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wave_drive/core/shared/widgets/chart/crypto_name_data_source.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

class TradingViewWidgetHtml extends StatefulWidget {
  const TradingViewWidgetHtml({required this.cryptoName, super.key});

  final String cryptoName;

  @override
  State<TradingViewWidgetHtml> createState() => _TradingViewWidgetHtmlState();
}

class _TradingViewWidgetHtmlState extends State<TradingViewWidgetHtml> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Optionally, you can use progress (0–100) to make a linear progress bar
            debugPrint('Loading progress: $progress%');
          },
          onPageStarted: (String url) {
            setState(() => isLoading = true);
          },
          onPageFinished: (String url) {
            setState(() => isLoading = false);
          },
          onWebResourceError: (error) {
            setState(() => isLoading = false);
          },
        ),
      )
      ..enableZoom(true)
      ..loadHtmlString(
        CryptoNameDataSource.cryptoNameAndSource(widget.cryptoName),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebViewWidget(controller: controller),
        if (isLoading)
          const Center(
            child: SizedBox(width: 32, height: 32, child: AppLoading()),
          ),
      ],
    );
  }
}
