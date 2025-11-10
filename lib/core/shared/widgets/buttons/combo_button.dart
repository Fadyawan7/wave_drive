import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/utils/debounce.dart';

class ComboButton extends StatefulWidget {
  const ComboButton({
    super.key,
    required this.onEnd,
    this.duration = 500,
    this.rightPadding = 34,
  });

  final Function(int) onEnd;

  ///Milliseconds
  final int duration;
  final double rightPadding;

  @override
  State<ComboButton> createState() => _ComboButtonState();
}

class _ComboButtonState extends State<ComboButton> {
  int _amountMultipleClick = 1;

  @override
  void initState() {
    EasyDebounce.debounce(
      'multiple-click-debounce',
      Duration(milliseconds: widget.duration),
      () {
        widget.onEnd(_amountMultipleClick);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _amountMultipleClick += 1;
        });
        EasyDebounce.debounce(
          'multiple-click-debounce',
          Duration(milliseconds: widget.duration),
          () {
            widget.onEnd(_amountMultipleClick);
          },
        );
      },
      child: Stack(
        children: [
          Positioned(
            right: widget.rightPadding,
            bottom: 30,
            child: Column(
              children: [
                Text(
                  "x$_amountMultipleClick",
                  style: AppTextStyles.textMed24.copyWith(
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Container(
                  height: 100,
                  width: 100,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.red[200]!, Colors.red[500]!],
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Combo",
                      style: AppTextStyles.textBold18.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Lottie.asset(
            AppLotties.sendLuckyGiftButton,
            height: 200,
            width: 200,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
