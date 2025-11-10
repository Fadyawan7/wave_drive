// import 'package:flutter/material.dart';

// import 'package:wave_drive/core/routes/routes.dart';
// import 'package:wave_drive/core/shared/themes/themes.dart';
// import 'package:wave_drive/core/shared/widgets/bottom_sheet/default_bottom_sheet.dart';

// class EditAvatarBottomSheet {
//   static Future<T?> show<T>(
//     BuildContext context, {
//     bool barrierDismissible = true,
//     required Function() onTakePhoto,
//     required Function() onChoosePhoto,
//   }) async {
//     return DefaultBottomSheet.show<T>(
//       context,
//       barrierDismissible: barrierDismissible,
//       showDivider: false,
//       topLeft: 12,
//       topRight: 12,
//       initialChildSize: .3,
//       minHeight: .3,
//       maxHeight: .3,
//       gradient: LinearGradient(
//         begin: Alignment.topRight,
//         end: Alignment.bottomLeft,
//         colors: [
//           const Color(0xff0AEBEE).withOpacity(0.8),
//           Colors.white38,
//           Colors.white38,
//         ],
//       ),
//       child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(
//             top: 32.0,
//             left: 32,
//             right: 32,
//             bottom: 32,
//           ),
//           child: Column(
//             children: [
//               _buildItem(
//                 title: 'Choose from Album',
//                 onTap: () {
//                   AppNavigator.pop(context);
//                   onChoosePhoto();
//                 },
//               ),
//               _buildItem(
//                 title: 'Take Photo',
//                 onTap: () {
//                   AppNavigator.pop(context);
//                   onTakePhoto();
//                 },
//               ),
//               _buildItem(
//                 title: 'Cancel',
//                 isCancel: true,
//                 onTap: () {
//                   AppNavigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
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
//                 color: isCancel ? AppColors.grayAC : AppColors.gray,
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
