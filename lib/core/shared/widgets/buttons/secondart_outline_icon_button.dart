import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/border/gradient_box_border.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/loading/app_loading.dart';

class SecondaryOutlineIconButton extends StatefulWidget {
  const SecondaryOutlineIconButton({
    super.key,
    this.onPressed,
    this.textStyle,
    this.color,
    this.height = 33.0,
    this.radius = 50.0,
    this.borderWidth = 1,
    this.isLoading = false,
    required this.text,
    required this.icon,
  });

  final Function()? onPressed;
  final double borderWidth;
  final Color? color;
  final double height;
  final double radius;
  final TextStyle? textStyle;
  final bool isLoading;
  final String text;
  final Widget icon;

  @override
  State<SecondaryOutlineIconButton> createState() =>
      _SecondaryOutlineIconButtonState();
}

class _SecondaryOutlineIconButtonState
    extends State<SecondaryOutlineIconButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: widget.onPressed,
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(widget.radius),
        overlayColor: MaterialStateColor.resolveWith(
          (states) => AppColors.stroke.withOpacity(.2),
        ),
        child: Ink(
          height: widget.height,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
          decoration: BoxDecoration(
            border: GradientBoxBorder(
              gradient: AppColors.gradientbutton,
              borderRadius: BorderRadius.circular(26),
            ),
            borderRadius: BorderRadius.circular(widget.radius),
          ),
          child: Center(
            child: widget.isLoading
                ? const AppLoading(color: AppColors.primaryD0)
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.icon,
                      const Gap(5),
                      Text(
                        widget.text,
                        style:
                            widget.textStyle ??
                            AppTextStyles.textMed14.copyWith(
                              color: AppColors.primaryD0,
                            ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
