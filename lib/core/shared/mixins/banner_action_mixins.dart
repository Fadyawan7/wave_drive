import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher_string.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';

mixin BannerActionsMixin {
  void onTapBanner(BuildContext context, String? link, bool isInternalLink) {
    if (link == null || link.isEmpty || !link.isUrl) return;

    String url = link;

    // if (url.contains('{{user_id}}')) {
    //   url = url.replaceAll(
    //     '{{user_id}}',
    //     injector<UserCubit>().currentUser?.id ?? "",
    //   );
    // }

    // injector<FirebaseAnalyticsService>().log(
    //   AnalyticEvent.tapOnBanner,
    //   parameters: {'bannerUrl': url},
    // );

    if (isInternalLink) {
    //  AppNavigator.push(context, WebviewRoute(appbarTitle: 'Rocco', url: url));
    } else {
      launchUrlString(url, mode: LaunchMode.externalApplication);
    }
  }
}
