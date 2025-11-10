import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/themes/app_colors.dart';
import 'package:wave_drive/core/shared/themes/app_icons.dart';
import 'package:wave_drive/core/shared/themes/app_images.dart';
import 'package:wave_drive/core/shared/widgets/avatar/avatar_default.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

class MemberList extends StatelessWidget {
  const MemberList({
    super.key,
    required this.urlImages,
    this.username,
    this.size = 40,
    this.totalshow = 6,
    this.showOrderNumber = false,
    this.hasMore = false,
    this.onTap,
  });

  final List<String> urlImages;
  final List<String>? username;
  final double size;
  final int totalshow;
  final bool showOrderNumber;
  final bool hasMore;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          ...List.generate(urlImages.length, (index) {
            final curIndex = urlImages.length - index - 1;

            return Padding(
              padding: EdgeInsets.only(left: (size * 3 / 4) * curIndex),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2, color: AppColors.white),
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    if (curIndex <= totalshow)
                      AvatarDefault(
                        radius: size / 2,
                        imageUrl: urlImages[curIndex],
                        username: username?[index],
                      ),

                    if (hasMore && curIndex == 6) ...[
                      Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.black.withOpacity(.6),
                        ),
                        padding: EdgeInsets.only(left: size / 5),
                        alignment: Alignment.center,
                        child: const AppImage(path: AppIcons.threeDots),
                      ),
                    ],
                    if (showOrderNumber && index < 3)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: AppImage(
                          path: curIndex == 0
                              ? AppImages.numberOne
                              : curIndex == 1
                              ? AppImages.numberTwo
                              : AppImages.numberThree,
                          size: 10,
                        ),
                      ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
