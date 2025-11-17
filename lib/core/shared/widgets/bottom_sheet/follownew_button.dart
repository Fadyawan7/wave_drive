import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';
import 'package:wave_drive/generated/locale_keys.dart';

class FollowNewButton extends StatefulWidget {
  const FollowNewButton({
    super.key,
    this.onPressed,
    this.textStyle,
    this.color,
    this.height = 33.0,
    this.radius = 50.0,
    this.borderWidth = 1,
    this.isLoading = false,
    this.isFollowed = false,
  });

  final Function(bool isFollowed)? onPressed;
  final double borderWidth;
  final Color? color;
  final double height;
  final double radius;
  final TextStyle? textStyle;
  final bool isLoading;
  final bool isFollowed;

  @override
  State<FollowNewButton> createState() => _FollowNewButtonState();
}

class _FollowNewButtonState extends State<FollowNewButton> {
  late bool isFollowed;

  @override
  void initState() {
    isFollowed = widget.isFollowed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          setState(() {
            isFollowed = !isFollowed;
          });
          widget.onPressed?.call(isFollowed);
        },
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(widget.radius),
        overlayColor: WidgetStateColor.resolveWith(
          (states) => AppColors.stroke.withOpacity(.2),
        ),
        child: Ink(
          height: widget.height,
          width: 100,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xffAE9DF6), Color(0xff0AEBEE)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          child: Center(
            child: widget.isLoading
                ? const AppLoading()
                : Text(
                    isFollowed
                        ? LocaleKeys.action_unfollow.tr()
                        : LocaleKeys.action_follow.tr(),
                    style:
                        widget.textStyle ??
                        AppTextStyles.textMed14.copyWith(
                          color: AppColors.white,
                        ),
                  ),
          ),
        ),
      ),
    );
  }
}
