import 'package:flutter/material.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';
import 'package:wave_drive/core/shared/themes/themes.dart';
import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
import 'package:wave_drive/core/shared/widgets/misc/shadow_widget.dart';

class LiveStreamingCard extends StatelessWidget {
  const LiveStreamingCard({
    super.key,
    required this.imageUrl,
    this.height = 170,
    this.width,
    this.onTap,
    this.viewCount = 0,
    this.isPKLivestream = false,
    required this.title,
    this.hostName,
    this.adminLiveTag,
  });

  final double? height;
  final String imageUrl;
  final String title;
  final double? width;
  final int viewCount;
  final bool isPKLivestream;
  final Function()? onTap;
  final String? hostName;
  final String? adminLiveTag;

  bool get isTop1LiveTag =>
      adminLiveTag?.toLowerCase().contains('top 1') ?? false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.darkPrimary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppImage(
                  path: imageUrl,
                  errorPlaceHolder: (context) => Center(
                    child: Text(
                      hostName?.substring(0, 1).toUpperCase() ?? '',
                      style: AppTextStyles.textBold32.copyWith(
                        color: AppColors.white,
                        fontSize: 60,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (adminLiveTag.isNotNullOrEmpty || isPKLivestream)
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: !isTop1LiveTag
                                  ? AppColors.black.withOpacity(.25)
                                  : null,
                              gradient: isTop1LiveTag
                                  ? AppColors.gradientYellow
                                  : null,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            child: isPKLivestream
                                ? const SizedBox(
                                    height: 14,
                                    child: AppImage(path: AppImages.logoPK),
                                  )
                                : Text(
                                    adminLiveTag!,
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                    style: AppTextStyles.textMed12.copyWith(
                                      color: isTop1LiveTag
                                          ? AppColors.pinkF1
                                          : AppColors.white,
                                    ),
                                  ),
                          ),
                        )
                      else
                        const SizedBox(),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(50),
                      //     color: AppColors.black.withOpacity(.3),
                      //   ),
                      //   padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      //   child: Row(
                      //     children: [
                      //       const AppImage(path: AppIcons.fireV2),
                      //       const Gap(4),
                      //       Text(
                      //         formatIntNumber(viewCount),
                      //         style: AppTextStyles.textMed12.copyWith(color: AppColors.white),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  ShadowWidget(
                    widget: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.textMed14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
