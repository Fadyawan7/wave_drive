import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class WhiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WhiteAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.onClose,
    this.title,
    this.titleWidget,
    this.elevation = 0,
    this.leading,
    this.scrolledUnderElevation,
    this.actions,
    this.isWhite = true,
  });

  final Function()? onClose;
  final double height;
  final String? title;
  final Widget? titleWidget;
  final double elevation;
  final Widget? leading;
  final double? scrolledUnderElevation;
  final List<Widget>? actions;
  final bool isWhite;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final canPop = AppNavigator.canPop(context);

    return _CustomAppBar(
      elevation: elevation,
      scrolledUnderElevation: scrolledUnderElevation ?? 0,
      actions: actions,
      canPop: canPop,
      leading: leading,
      titleWidget: titleWidget,
      title: title,
      background: isWhite ? AppColors.white : AppColors.transparent,
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    required this.elevation,
    required this.scrolledUnderElevation,
    required this.actions,
    required this.canPop,
    this.leading,
    this.titleWidget,
    this.title,
    required this.background,
  });

  final double elevation;
  final double? scrolledUnderElevation;
  final List<Widget>? actions;
  final bool canPop;
  final Widget? leading;
  final Widget? titleWidget;
  final String? title;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: background,
      elevation: elevation,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: scrolledUnderElevation,
      centerTitle: true,
      leadingWidth: 48,
      actions: actions,
      leading: !canPop
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child:
                  leading ??
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: AppColors.gray,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
            ),
      title:
          titleWidget ??
          (title == null
              ? const SizedBox()
              : Text(
                  title!,
                  style: AppTextStyles.textMed20.copyWith(color: Colors.black),
                )),
    );
  }
}
