import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/widgets/cards/glass_card.dart';

class GlassChatTextField extends StatelessWidget {
  const GlassChatTextField({
    super.key,
    this.onSubmit,
    this.hintText,
    this.showSendButton = false,
    this.controller,
    this.maxLines = 2,
    this.minLines = 1,
    this.prefix,
    this.maxLenght,
    this.isShowMaxLength = false,
    this.focusNode,
  });

  final Function(String? value)? onSubmit;
  final String? hintText;
  final bool showSendButton;
  final bool isShowMaxLength;
  final TextEditingController? controller;
  final int maxLines;
  final int minLines;
  final int? maxLenght;
  final Widget? prefix;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      color: showSendButton
          ? Colors.transparent
          : AppColors.black.withOpacity(.4),
      hasBorder: false,
      borderRadius: BorderRadius.circular(36),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: TextFormField(
              maxLength: maxLenght,
              buildCounter:
                  (
                    BuildContext context, {
                    required int currentLength,
                    required bool isFocused,
                    required int? maxLength,
                  }) {
                    if (isShowMaxLength) {
                      return Text(
                        "$currentLength / $maxLength",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      );
                    }
                    return null; // hide counter
                  },

              focusNode: focusNode,
              controller: controller,
              style: AppTextStyles.textMed12.copyWith(
                color: showSendButton ? AppColors.purple : AppColors.white,
              ),
              cursorColor: AppColors.purple,
              maxLines: maxLines,
              minLines: minLines,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (value) => onSubmit?.call(value),
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: prefix,
                prefixIconConstraints: const BoxConstraints(maxHeight: 24),
                filled: true,
                isDense: true,
                fillColor: Colors.transparent,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 10,
                ),
                hintText: hintText,
                hintStyle: AppTextStyles.textMed12.copyWith(
                  color: !showSendButton ? AppColors.white : AppColors.gray,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
