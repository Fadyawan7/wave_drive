import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:wave_drive/core/shared/widgets/app_overlay.dart';

abstract class BaseScreen<T extends StatefulWidget> extends State<T>
    with AutoRouteAwareStateMixin, AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return KeyboardDismissOnTap(child: buildBody(context));
  }

  Widget buildBody(BuildContext context);

  @override
  bool get wantKeepAlive => keepAlive;
  bool keepAlive = false;

  void loading(bool isLoading) {
    isLoading
        ? AppOverlay.showProgressLoading()
        : AppOverlay.hideProgressLoading();
  }

  void freeze(bool isFreeze) {
    isFreeze
        ? AppOverlay.showTransparentOverlay()
        : AppOverlay.hideTransparentOverlay();
  }

  void toast(
    String message, {
    ToastPosition toastPosition = ToastPosition.bottom,
  }) {
    EasyLoadingToastPosition position = EasyLoadingToastPosition.bottom;
    switch (toastPosition) {
      case ToastPosition.top:
        position = EasyLoadingToastPosition.top;
      case ToastPosition.center:
        position = EasyLoadingToastPosition.center;
      case ToastPosition.bottom:
        position = EasyLoadingToastPosition.bottom;
    }
    AppOverlay.showToast(message, toastPosition: position);
  }

  void toastError(String error) {
    AppOverlay.showToastError(error);
  }
}

enum ToastPosition { top, center, bottom }
