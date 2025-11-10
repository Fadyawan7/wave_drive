import 'package:flutter/material.dart';
import 'package:wave_drive/core/routes/app_navigator.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.height = kToolbarHeight,
    this.onClose,
    this.title,
    this.titleWidget,
    this.elevation = 0,
    this.leading,
    this.scrolledUnderElevation,
    this.actions,
    this.backgroundColor,
    this.surfaceTintColor,
    this.centertitle,
    this.gradient, // 👈 New field
  });

  final Function()? onClose;
  final double height;
  final String? title;
  final Widget? titleWidget;
  final double elevation;
  final Widget? leading;
  final double? scrolledUnderElevation;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final bool? centertitle;
  final Gradient? gradient; // 👈 New field

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final canPop = AppNavigator.canPop(context);

    return CustomAppBar(
      centertitle: centertitle,
      elevation: elevation,
      backgroundColor: backgroundColor,
      scrolledUnderElevation: scrolledUnderElevation,
      actions: actions,
      canPop: canPop,
      leading: leading,
      titleWidget: titleWidget,
      surfaceTintColor: surfaceTintColor,
      title: title,
      gradient: gradient, // 👈 Pass it
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.elevation,
    required this.scrolledUnderElevation,
    required this.actions,
    required this.canPop,
    this.leading,
    this.titleWidget,
    this.title,
    this.backgroundColor,
    this.surfaceTintColor,
    this.centertitle,
    this.gradient, // 👈 New field
  });

  final double elevation;
  final bool? centertitle;
  final double? scrolledUnderElevation;
  final List<Widget>? actions;
  final bool canPop;
  final Widget? leading;
  final Widget? titleWidget;
  final String? title;
  final Color? backgroundColor;
  final Color? surfaceTintColor;
  final Gradient? gradient; // 👈 New field

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (gradient != null)
          Container(
            height: kToolbarHeight + MediaQuery.of(context).padding.top,
            decoration: BoxDecoration(gradient: gradient),
          ),
        AppBar(
          surfaceTintColor: surfaceTintColor,
          backgroundColor: gradient != null
              ? Colors.transparent
              : (backgroundColor ?? AppColors.darkPrimary),
          elevation: elevation,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: scrolledUnderElevation,
          centerTitle: centertitle ?? true,
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
                          splashColor: AppColors.stroke.withOpacity(.2),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.white,
                          ),
                          onPressed: () {
                            AppNavigator.pop(context);
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
                      style: AppTextStyles.textBold18.copyWith(
                        color: AppColors.white,
                      ),
                    )),
        ),
      ],
    );
  }
}
