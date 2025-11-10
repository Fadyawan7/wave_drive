// Removed dart:io import for web compatibility
import 'package:wave_drive/core/shared/utils/platform_utils.dart';

enum Environment { development, staging, production }

class AppConfig {
  static Environment get flavor => Environment.values.firstWhere(
    (e) => e.name == const String.fromEnvironment('FLAVOR'),
    orElse: () => Environment.development,
  );


  static String get googleAuthClintId =>
      const String.fromEnvironment('GOOGLE_AUTH_CLINT_ID');

  static String get baseUrl => const String.fromEnvironment('BASE_URL');
  static String get mexcUrl => const String.fromEnvironment('MEXC_API');
  static String get imageUrl => const String.fromEnvironment('IMAGE_URL');
  static String get socketIoUrl =>
      const String.fromEnvironment('SOCKET_IO_URL');
  static String get baseUrlIOS => const String.fromEnvironment('BASE_URL_IOS');
  static String get twitterApiKey =>
      const String.fromEnvironment('TWITTER_API_KEY');
  static String get twitterApiSecretKey =>
      const String.fromEnvironment('TWITTER_API_SECRET_KEY');
  static String get twitterRedirectUri =>
      const String.fromEnvironment('TWITTER_REDIRECT_URI');
  static String get zegoAppId => const String.fromEnvironment('ZEGO_APP_ID');
  static String get zegoAppSign =>
      const String.fromEnvironment('ZEGO_APP_SIGN');
  static String get prefixDynamicLink =>
      const String.fromEnvironment('PREFIX_DYNAMIC_LINK_DEV');
  static String get tencentLicenseURL =>
      const String.fromEnvironment('TENCENT_LICENSE_URL');
  static String get tencentLicenseKey =>
      const String.fromEnvironment('TENCENT_LICENSE_KEY');
  static String get tencentVideoUrl =>
      const String.fromEnvironment('TENCENT_VIDEO_URL');
  static String get feedbackUrl =>
      const String.fromEnvironment('FEED_BACK_URL');
  static String get imageHeaderAndroid =>
      const String.fromEnvironment('IMAGE_HEADER_ANDROID');
  static String get imageHeaderIOS =>
      const String.fromEnvironment('IMAGE_HEADER_IOS');
  static String get uploadImageDomain =>
      const String.fromEnvironment('UPLOAD_IMAGE_DOMAIN');
  static String get miniGameDomain =>
      const String.fromEnvironment('MINI_GAME_DOMAIN');

  ///-- Ads
  static String get androidForYouVideoAds =>
      const String.fromEnvironment('ANDROID_VIDEO_BANNER_AD_UNIT');
  static String get iosForYouVideoAds =>
      const String.fromEnvironment('IOS_VIDEO_BANNER_AD_UNIT');
  static String get forYouVideoAdsUnit =>
      PlatformUtils.isAndroid ? androidForYouVideoAds : iosForYouVideoAds;

  static String get androidBannerAds =>
      const String.fromEnvironment('ANDROID_BANNER_AD_UNIT');
  static String get iosBannerAds =>
      const String.fromEnvironment('IOS_BANNER_AD_UNIT');
  static String get bannerAdsUnit =>
      PlatformUtils.isAndroid ? androidBannerAds : iosBannerAds;

  static String get androidRewardAds =>
      const String.fromEnvironment('ANDROID_REWARD_AD_UNIT');
  static String get iosRewardAds =>
      const String.fromEnvironment('IOS_REWARD_AD_UNIT');
  static String get rewardAdsUnit =>
      PlatformUtils.isAndroid ? androidRewardAds : iosRewardAds;

  static String get androidFbBannerAd =>
      const String.fromEnvironment('ANDROID_FB_BANNER_AD');
  static String get androidFbRewardAd =>
      const String.fromEnvironment('ANDROID_FB_REWARD_AD');
  static String get androidFbInterstitialAd =>
      const String.fromEnvironment('ADNROID_FB_INTERSTITIAL_AD');

  static String get iosFbBannerAd =>
      const String.fromEnvironment('IOS_FB_BANNER_AD');
  static String get iosFbRewardAd =>
      const String.fromEnvironment('IOS_FB_REWARD_AD');
  static String get iosFbInterstitialAd =>
      const String.fromEnvironment('IOS_FB_INTERSTITIAL_AD');

  static String get fbBannerAd =>
      PlatformUtils.isAndroid ? androidFbBannerAd : iosFbBannerAd;
  static String get fbRewardAd =>
      PlatformUtils.isAndroid ? androidFbRewardAd : iosFbRewardAd;
  static String get fbInterstitialAd =>
      PlatformUtils.isAndroid ? androidFbInterstitialAd : iosFbInterstitialAd;

  static String get stripePublishableKey =>
      const String.fromEnvironment('STRIPE_PUBLISHABLE_KEY');
  static String get otpLessAppId => const String.fromEnvironment('OTP_LESS_ID');

  static String get webURL => const String.fromEnvironment('WEB_URL');
  static String get rankingUrl => "$webURL/rank";
  static String get shopUrl => "$webURL/shop";
  static String get deactivateAccountUrl => "$webURL/deactivate-account";
  static String get helpUrl => "$webURL/help";
  static String get privacyUrl => "$webURL/privacy-policy";
  static String get guidelinesUrl => "$webURL/guideline";
  static String get aboutUsUrl => "$webURL/about";
  static String get userLevelUrl => "$webURL/level/1";
  static String get userSendingLevelUrl => "$webURL/level/1";

  static String get userHostingLevelUrl => "$webURL/level/2";

  static String get vipCenterUrl => "$webURL/svip";
  static String svipCenterUrl(String userId) => "$vipCenterUrl/$userId";
  static String get weeklyRankingUrl => "$webURL/ranking/weekly";
  static String get liveCenterUrl => "$webURL/host-center";
  static String get inviteUrl => "$webURL/invite";
  static String invitationUrl(String userId) => "$inviteUrl/$userId";

  static String invitationRuleUrl(String userId) =>
      "$webURL/invitation-rules/$userId";
  static String rankingUserUrl(String userId) =>
      '$rankingUrl/$userId?type=user';
  static String rankingFamilyUrl(String userId) =>
      '$rankingUrl/$userId?type=family';

  ///Withdraw
  static String get withdrawUrl => "$webURL/withdraw";
  static String withdrawMethodsUrl(String userId) => "$withdrawUrl/$userId";

  static String get withdrawAmountsUrl => "$webURL/withdrawamount";
  static String withdrawAmountMethodsUrl(String userId) =>
      "$withdrawAmountsUrl/$userId";

  static String withdrawRequestUrl({
    required String userId,
    required String methodId,
  }) => "$withdrawUrl/request/$userId/$methodId";
  static String withdrawRecordsUrl(String userId) => "$webURL/records";
  static String withdrawRecordDetailUrl(String requestId) =>
      "$webURL/records/success/$requestId";
  static String get rcoinWithdrawScamAlertUrl => "$webURL/scam-alert";

  // for agency
  static String get baseUrlForAgency =>
      const String.fromEnvironment('BASE_URL_FOR_AGENCY');
  static String get baseUrlIOSForAgency =>
      const String.fromEnvironment('BASE_URL_IOS_FOR_AGENCY');

  // for game
  static String get baseUrlForGame =>
      const String.fromEnvironment('BASE_URL_GAME');

  @override
  String toString() {
    return '''

      flavor: ${flavor.name}
      baseUrl: $baseUrl
      baseUrlIOS: $baseUrlIOS
      webUrl: $webURL
      baseUrlForAgency:$baseUrlForAgency
      baseUrlIOSForAgency:$baseUrlIOSForAgency
      socketIoUrl:$socketIoUrl
      s3 bucketurl:$imageUrl
      
    ''';
  }
}
