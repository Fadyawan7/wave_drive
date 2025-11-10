import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:wave_drive/core/shared/widgets/cards/glass_card.dart';

class MessageChatTextField extends StatelessWidget {
  const MessageChatTextField({
    super.key,
    this.onSubmit,
    this.hintText,
    this.controller,
    this.maxLines = 2,
    this.minLines = 1,
    this.prefix,
    this.suffix,
    required this.focusNode,
    this.textInputAction,
    this.onChanged,
    this.onTap,
  });

  final Function(String? value)? onSubmit;
  final String? hintText;
  final TextEditingController? controller;
  final int maxLines;
  final int minLines;
  final Widget? prefix;
  final Widget? suffix;
  final FocusNode focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      color: AppColors.white.withOpacity(.75),
      hasBorder: false,
      borderRadius: BorderRadius.circular(36),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: TextFormField(
              onChanged: onChanged,
              onTap: onTap,

              focusNode: focusNode,
              controller: controller,
              style: AppTextStyles.text14.copyWith(color: AppColors.black),
              cursorColor: AppColors.purple,
              maxLines: maxLines,
              minLines: minLines,
              textInputAction: textInputAction ?? TextInputAction.done,
              onFieldSubmitted: (value) => onSubmit?.call(value),

              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: prefix,
                suffixIcon: suffix,
                prefixIconConstraints: const BoxConstraints(maxHeight: 30),
                suffixIconConstraints: const BoxConstraints(maxHeight: 30),
                filled: true,
                isDense: true,
                fillColor: Colors.transparent,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                hintText: hintText,
                hintStyle: AppTextStyles.text14.copyWith(color: AppColors.gray),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
