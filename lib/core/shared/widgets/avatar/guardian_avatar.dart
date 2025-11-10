// import 'package:flutter/material.dart';
// import 'package:wave_drive/core/data/models/user/user_model.dart';
// import 'package:wave_drive/core/shared/themes/themes.dart';
// import 'package:wave_drive/core/shared/widgets/avatar/avatar_default.dart';
// import 'package:wave_drive/core/shared/widgets/images/app_image.dart';

// class GuardianAvatar extends StatelessWidget {
//   final UserModel? user;
//   final VoidCallback onTap;

//   const GuardianAvatar({super.key, this.user, required this.onTap, required guardian});

//   @override
//   Widget build(BuildContext context) {
//     final bool isGuardianAvailable = user != null && user!.guardian != null;

//     if (!isGuardianAvailable) return const SizedBox.shrink();
//     final guardian = user!.guardian!;

//     return GestureDetector(
//       onTap: onTap,
//       child: Stack(
//         alignment: Alignment.center,
//         clipBehavior: Clip.antiAlias,
//         children: [
//           AvatarDefault(
//             radius: 20,
//             username: guardian.name,
//             imageUrl: guardian.picture,
//           ),
//           const AppImage(size: 50, path: AppIcons.guardian),
//         ],
//       ),
//     );
//   }
// }
