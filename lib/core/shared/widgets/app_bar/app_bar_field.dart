import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_text_styles.dart';

class AppBarField extends StatelessWidget {
  const AppBarField({super.key, required this.text, required this.onpress});
  final String text;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                onpress();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.whitecolor,
              )),
          Gap(MediaQuery.of(context).size.width * 0.23),
          Text(
            text,
            style: AppTextStyles.heading1,
          )
        ],
      ),
    );
  }
}
