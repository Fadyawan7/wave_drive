import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:wave_drive/core/data/local/secure_storage_helper.dart';
// ignore: unused_import
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/widgets/appbar/cupertino_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/appbar/main_app_bar.dart';
import 'package:wave_drive/core/shared/widgets/loading/svga_loading.dart';

@RoutePage()
class WebviewScreen extends StatefulWidget {
  const WebviewScreen({
    super.key,
    this.appbarTitle,
    required this.url,
    this.isWhiteAppbar = false,
    this.isInBottomSheet = false,
    this.leadingWhiteAppbar,
    this.onReceiveMessage,
    this.safeTopArea = false,
  });

  final String? appbarTitle;
  final String url;
  final bool isWhiteAppbar;
  final bool isInBottomSheet;
  final Widget? leadingWhiteAppbar;
  final Function(String message, WebViewController controller)?
  onReceiveMessage;
  final bool safeTopArea;

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    AppLogger.d("URL of WebView: ${widget.url}");
    if (widget.url != "") {
      _controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(widget.url))
        ..addJavaScriptChannel(
          'FlutterUserChannel',
          onMessageReceived: (message) async {
            AppLogger.d(
              '[JavaScriptChannel - FlutterUserChannel] ${message.message}',
            );

            ///GO LIVE - in Live Center Webview
          },
        )
        ..addJavaScriptChannel(
          'Flutter',
          onMessageReceived: (message) {
            AppLogger.d('[JavaScriptChannel - Flutter]: ${message.message}');
            widget.onReceiveMessage?.call(message.message, _controller);
          },
        )
        ..addJavaScriptChannel(
          'FlutterCloseWebview',
          onMessageReceived: (message) {},
        )
        ..setNavigationDelegate(
          NavigationDelegate(
            onNavigationRequest: (request) async {
              /// Google forms
              if (request.url.contains("intent")) {
                final params = request.url.split(';');
                final queryParameters = <String, String>{};

                for (final param in params) {
                  final parts = param.split('=');
                  if (parts.length == 2) {
                    final key = parts[0];
                    final value = Uri.decodeFull(parts[1]);
                    queryParameters[key] = value;
                  }
                }
                final fallbackUrl = queryParameters['S.browser_fallback_url'];
                if (fallbackUrl != null &&
                    await canLaunchUrl(Uri.parse(fallbackUrl))) {
                  await _controller.loadRequest(Uri.parse(fallbackUrl));
                } else {
                  AppLogger.e('Can not launch link ${widget.url}');
                }
                return Future.value(NavigationDecision.prevent);
              }
              return Future.value(NavigationDecision.navigate);
            },
            onPageFinished: (String url) {
              _setAccessToken();
              setState(() {
                _isLoading = false;
              });
            },
          ),
        );
    }

    if (Platform.isAndroid) {
      final myAndroidController =
          _controller.platform as AndroidWebViewController;

      myAndroidController.setOnShowFileSelector((params) async {
        final result = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.image,
        );
        final uriList = <String>[];

        if (result != null && result.files.isNotEmpty) {
          for (final file in result.files) {
            if (file.path != null) {
              uriList.add(File(file.path!).uri.toString());
            }
          }
        }
        return uriList;
      });
    }
  }

  Future<void> _setAccessToken() async {
    final token = await SecureStorageHelper.getSavedAccessToken();
    if (token != null) {
      await _controller.runJavaScript(
        'localStorage.setItem("accessToken", "$token")',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
      Factory(() => EagerGestureRecognizer()),
    };

    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          _controller.goBack();
          return false; // don’t pop Flutter page
        }
        return true; // pop Flutter page
      },
      child: Scaffold(
        appBar: widget.appbarTitle == null
            ? null
            : widget.isWhiteAppbar
            ? WhiteAppBar(
                    title: widget.appbarTitle,
                    leading:
                        widget.leadingWhiteAppbar ??
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () async {
                            if (await _controller.canGoBack()) {
                              _controller.goBack();
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        ),
                  )
                  as PreferredSizeWidget
            : MainAppBar(
                leading: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    splashRadius: 20,
                    splashColor: AppColors.stroke.withOpacity(.2),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.white,
                    ),
                    onPressed: () async {
                      if (await _controller.canGoBack()) {
                        _controller.goBack();
                      } else {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
                titleWidget: Text(
                  widget.appbarTitle!,
                  style: AppTextStyles.textBold18.copyWith(
                    color: AppColors.white,
                  ),
                ),
                backgroundColor: AppColors.transparent,
                gradient: AppColors.gradientborder,
              ),
        body: widget.url.isEmpty
            ? const Center(child: Text('URL is empty'))
            : _isLoading
            ? const Center(child: SVGALoading())
            : Padding(
                padding: widget.safeTopArea
                    ? EdgeInsets.only(top: MediaQuery.paddingOf(context).top)
                    : EdgeInsets.zero,
                child: WebViewWidget(
                  controller: _controller,
                  gestureRecognizers: widget.isInBottomSheet
                      ? gestureRecognizers
                      : const <Factory<OneSequenceGestureRecognizer>>{},
                ),
              ),
      ),
    );
  }
}
