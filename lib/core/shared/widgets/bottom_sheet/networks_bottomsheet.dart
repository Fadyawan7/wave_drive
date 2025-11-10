// import 'package:flutter/material.dart';
// import 'package:wave_drive/core/shared/themes/app_colors.dart';
// import 'package:wave_drive/core/shared/themes/app_text_styles.dart';
// import 'package:wave_drive/core/shared/widgets/gap.dart';
// import 'package:wave_drive/core/shared/widgets/images/app_image.dart';
// import 'package:wave_drive/core/shared/themes/app_icons.dart';

// class SelectNetworkBottomSheet extends StatelessWidget {
//   // final List<NetworkModel> networks;

//   const SelectNetworkBottomSheet({super.key, required this.networks});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         color: AppColors.black0A,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(20, 10, 20, 40),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Center(
//               child: Container(
//                 width: 50,
//                 height: 4,
//                 decoration: BoxDecoration(
//                   color: Colors.white24,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//             const Gap(16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Select Network",
//                   style: AppTextStyles.text17.copyWith(
//                     color: AppColors.white,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: AppImage(
//                     path: AppIcons.close,
//                     width: 20,
//                     height: 20,
//                     color: AppColors.white,
//                   ),
//                 ),
//               ],
//             ),
//             const Gap(20),
//             Container(
//               decoration: BoxDecoration(
//                 color: AppColors.black14,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const TextField(
//                 style: TextStyle(color: AppColors.white),
//                 decoration: InputDecoration(
//                   hintText: "Search network name",
//                   hintStyle: TextStyle(color: AppColors.gray6F),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: AppColors.gray6F,
//                     size: 20,
//                   ),
//                   border: InputBorder.none,
//                 ),
//               ),
//             ),
//             const Gap(16),
//             Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.white10,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.info_outline,
//                     color: Colors.white60,
//                     size: 18,
//                   ),
//                   const Gap(8),
//                   Expanded(
//                     child: Text(
//                       "Ensure the network matches the coin’s withdraw network to avoid losing assets.",
//                       style: AppTextStyles.text14.copyWith(
//                         color: AppColors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const Gap(20),
//             Flexible(
//               child: ListView.separated(
//                 shrinkWrap: true,
//                 itemCount: networks.length,
//                 separatorBuilder: (context, index) =>
//                     Divider(color: Colors.white12, thickness: 1, height: 1),
//                 itemBuilder: (context, index) {
//                   final n = networks[index];
//                   return GestureDetector(
//                     onTap: () => Navigator.pop(context, n.network),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             n.network,
//                             style: AppTextStyles.text15.copyWith(
//                               color: AppColors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const Gap(6),
//                           Text(
//                             "Fee: ${n.fee}   •   Est. arrival ${n.time}",
//                             style: AppTextStyles.text14.copyWith(
//                               color: AppColors.gray6F,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
