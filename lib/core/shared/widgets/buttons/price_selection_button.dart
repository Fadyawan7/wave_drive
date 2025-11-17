import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/utils/numeral.dart';
import 'package:wave_drive/core/shared/widgets/gap.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class PriceSelectionButton extends StatefulWidget {
  const PriceSelectionButton({
    super.key,
    required this.onSend,
    required this.totalDiamond,
    this.isLoading = false,
    this.isDisabled = true,
  });

  final Function(int amount) onSend;
  final int totalDiamond;
  final bool isLoading;
  final bool isDisabled;

  @override
  State<PriceSelectionButton> createState() => _PriceSelectionButtonState();
}

class _PriceSelectionButtonState extends State<PriceSelectionButton> {
  final _amount = ["1", "10", "20", "50"];
  int _selectedAmountIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Row(
            children: [
              AppImage(path: AppIcons.dimondPng, height: 16),
              const Gap(4),
              Text(
                widget.totalDiamond > 99999
                    ? widget.totalDiamond.numeral(
                        fractionDigits: 1,
                        isRoundDown: true,
                      )
                    : widget.totalDiamond.toString(),
                style: AppTextStyles.text16.copyWith(color: AppColors.white),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
                size: 14,
              ),
            ],
          ),
          const Gap(12),
          Expanded(
            child: Container(
              height: 36,
              padding: const EdgeInsets.only(left: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                color: AppColors.white.withOpacity(.3),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(_amount.length, (index) {
                        final isSelected = _selectedAmountIndex == index;
                        return _priceItem(
                          _amount[index],
                          isSelected: isSelected,
                          onTap: () {
                            setState(() {
                              _selectedAmountIndex = index;
                            });

                            widget.onSend(
                              int.parse(_amount[_selectedAmountIndex]),
                            );
                          },
                        );
                      }),
                    ),
                  ),
                  // const Gap(4),
                  // Expanded(
                  //   child: PrimaryButton(
                  //     text: 'Sending',
                  //     height: 36,
                  //     //color: AppColors.redFF,
                  //     isLoading: widget.isLoading,
                  //     loadingSize: 12,
                  //     isDisabled: widget.isDisabled,
                  //     onPressed: () {
                  //       widget.onSend(int.parse(_amount[_selectedAmountIndex]));
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _priceItem(String text, {bool isSelected = false, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        // height: 26,

        // padding: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          //   borderRadius: BorderRadius.circular(99),
          color: isSelected ? AppColors.purpleF6 : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              //  'x$text',
              text,
              style: AppTextStyles.textMed14.copyWith(
                color: isSelected ? AppColors.darkPrimary : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
