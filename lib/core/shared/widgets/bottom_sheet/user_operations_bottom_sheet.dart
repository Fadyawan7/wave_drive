// import 'package:flutter/material.dart';
// import 'package:wave_drive/core/routes/routes.dart';
// import 'package:wave_drive/core/shared/themes/app_colors.dart';
// import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
// import 'package:wave_drive/core/shared/widgets/bottom_sheet/default_bottom_sheet.dart';
// import 'package:wave_drive/core/shared/widgets/gap.dart';

// class UsersOperationsBottomSheet {
//   static Future show(
//     BuildContext context, {
//     bool isAdmin = false,
//     bool isMuted = false,
//     required Function() onKick,
//     required Function() onReport,
//     required Function() onBlock,
//     required Function() onMute,
//     required Function() onSetupMute,
//     required Function() onRemoveMute,
//     bool isHideKickOut = false,
//     bool isHost = false,
//   }) async {
//     return DefaultBottomSheet.show(
//       gradient: AppColors.gradientbg,
//       context,
//       maxHeight: .5,
//       initialChildSize: .5,
//       minHeight: .2,
//       child: Column(
//         children: [
//           const Gap(32),
//           if (isAdmin && !isHost)
//             if (isMuted) ...[
//               _buildItem(
//                 title: 'Remove Muted',
//                 onTap: () async {
//                   await AppNavigator.pop(context);
//                   onRemoveMute();
//                 },
//               ),
//             ] else ...[
//               _buildItem(
//                 title: 'Add Mute',
//                 onTap: () async {
//                   await AppNavigator.pop(context);
//                   onSetupMute();
//                 },
//               ),
//             ],
//           if (isAdmin && !isHost)
//             if (!isHideKickOut)
//               _buildItem(
//                 title: 'Kick out',
//                 onTap: () async {
//                   await AppNavigator.pop(context);
//                   onKick();
//                 },
//               ),
//           _buildItem(
//             title: 'Report',
//             onTap: () async {
//               await AppNavigator.pop(context);
//               onReport();
//             },
//           ),
//           _buildItem(
//             title: 'Add to blocklist',
//             onTap: () async {
//               await AppNavigator.pop(context);
//               onBlock();
//             },
//           ),
//           _buildItem(
//             title: 'Cancel',
//             isCancel: true,
//             onTap: () {
//               AppNavigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   static Widget _buildItem({
//     required String title,
//     required Function() onTap,
//     bool isCancel = false,
//   }) => InkWell(
//     onTap: onTap,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2.0),
//       child: Column(
//         children: [
//           Center(
//             child: Text(
//               title,
//               textAlign: TextAlign.center,
//               style: AppTextStyles.text16.copyWith(
//                 color: isCancel
//                     ? const Color(0xff000000).withOpacity(.5)
//                     : AppColors.black,
//               ),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.only(top: 4),
//             child: Divider(thickness: 0.1, color: AppColors.gray),
//           ),
//         ],
//       ),
//     ),
//   );
// }
