import 'package:json_annotation/json_annotation.dart';

enum AppLoadState {
  initial,
  loading,
  loadingMore,
  success,
  silent,
  error;

  const AppLoadState();

  bool get isLoading => this == AppLoadState.loading;
  bool get isLoadingMore => this == AppLoadState.loadingMore;
  bool get isSuccess => this == AppLoadState.success;
  bool get isError => this == AppLoadState.error;
}

enum SendingType {
  @JsonValue("room")
  room,
  @JsonValue("plateform")
  plateform,

  @JsonValue("simple")
  simple,
}

enum RoomType {
  @JsonValue("normal")
  normal,
  @JsonValue("pk")
  pk,
  @JsonValue("cohost")
  cohost,
  @JsonValue("audio")
  audio,
  @JsonValue("ended")
  ended;

  const RoomType();

  bool get isNormal => this == RoomType.normal;
  bool get isCoHost => this == RoomType.cohost;
  bool get isPK => this == RoomType.pk;
  bool get isAudio => this == RoomType.audio;
  bool get isEnded => this == RoomType.ended;
}

enum CoHostRequestStatus {
  initial,
  requesting,
  accepted,
  rejected,
  cancelled;

  const CoHostRequestStatus();

  bool get isInitial => this == CoHostRequestStatus.initial;
  bool get isRequesting => this == CoHostRequestStatus.requesting;
  bool get isAccepted => this == CoHostRequestStatus.accepted;
}

enum PKRequestStatus {
  initial,
  requesting,
  accepted;

  const PKRequestStatus();

  bool get isRequesting => this == PKRequestStatus.requesting;
  bool get isAccepted => this == PKRequestStatus.accepted;
}

enum SocialHubTab {
  followers(text: "Fans"),
  following(text: "Follow"),
  likes(text: "Likes");

  const SocialHubTab({required this.text});

  final String text;
}

enum ViewerStatus {
  public(text: 'Public', value: 'public'),
  private(text: 'Only me', value: 'private');

  const ViewerStatus({required this.text, required this.value});

  final String text;
  final String value;
}

enum RequestPKAgainStatus {
  initial,
  requesting,
  rejected,
  approved;

  const RequestPKAgainStatus();

  bool get isRequesting => this == RequestPKAgainStatus.requesting;
  bool get isRejected => this == RequestPKAgainStatus.rejected;
  bool get isApproved => this == RequestPKAgainStatus.approved;
}

enum EntranceEffectType {
  @JsonValue("Big")
  big,
  @JsonValue("Small")
  small,
  normal,
}

enum AllowType {
  @JsonValue("all")
  all,
  @JsonValue("allMuted")
  allMuted,
  @JsonValue("allFollowers")
  allFollowers,
  @JsonValue("allFanClubMember")
  allFanClubMember,
  @JsonValue("allAdmins")
  allAdmins,
}

enum MomentType {
  @JsonValue("image")
  image,
  @JsonValue("video")
  video,
}

enum WithdrawTransactionStatus {
  waiting,
  decline,
  paid,
  done,
  paying,
  report;

  const WithdrawTransactionStatus();

  bool get isWaiting => this == WithdrawTransactionStatus.waiting;
  bool get isDone => this == WithdrawTransactionStatus.done;
  bool get isPaid => this == WithdrawTransactionStatus.paid;
}

enum TimePeriod {
  // last30Days(text: "Last 30 days", value: "last_30_days"),
  // last7Days(text: "Last 7 days", value: "last_7_days"),
  today(text: "Today", value: "today"),
  currentWeek(text: "Current week", value: "current-week"),
  lastWeek(text: "Last week", value: "last-week"),
  thisMonth(text: "This month", value: "current-month"),
  lastMonth(text: "Last month", value: "last-month");

  const TimePeriod({required this.text, required this.value});

  final String text;
  final String value;
}

enum WeeklyPeriod {
  currentWeek(text: "Current week", value: "current-week"),
  lastWeek(text: "Last week", value: "last-week");

  const WeeklyPeriod({required this.text, required this.value});

  final String text;
  final String value;
}

enum MonthlyPeriod {
  thisMonth(text: "This Month", value: "current-month"),
  lastMonth(text: "Last Month", value: "last-month"),
  last3Months(text: "Last 3 Months", value: "last_3_months"),
  last6Months(text: "Last 6 Months", value: "last_6_months"),
  last9Months(text: "Last 9 Months", value: "last_9_months"),
  last12Months(text: "Last 12 Months", value: "last_12_months");

  const MonthlyPeriod({required this.text, required this.value});

  final String text;
  final String value;
}

enum EffectToggle {
  topRunway(text: "Top Runway", value: "top_runway"),
  giftEffect(text: "Gift Effect", value: "gift_effect"),
  luckyGift(text: "Lucky Gift", value: "lucky_gift"),
  entryAndCar(text: "Entry&Car", value: "entry_car"),
  floatingDanmaku(text: "Floating danmaku", value: "floating_danmaku"),
  trumpetBulletComments(
    text: "Trumpet bullet comments",
    value: "trumpet_bullet_comments",
  );

  const EffectToggle({required this.text, required this.value});

  final String text;
  final String value;
}

enum ReportType { user, livestream, video, moment }

enum DeleteType { user, video, moment }

enum MessageType { text, audio, video, file, image, link, gift }

enum StreamingType { audio, video }

enum RoomTye { party, video }

class Singleton {
  Singleton? _instance;
  Singleton._internal();
  Singleton getInstance() {
    _instance ??= Singleton._internal();
    return _instance!;
  }
}

enum DataSourceEnum { client, local }




enum TransferType {
  future(text: "Futures", value: "future"),
  spot(text: "Spot", value: "spot"),
  artibrage(text: "Arbitrage", value: "arbitrage");
 

  const TransferType({required this.text, required this.value});

  final String text;
  final String value;
}
