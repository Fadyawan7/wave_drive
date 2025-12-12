import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wave_drive/core/shared/utils/app_logger.dart';
import 'package:wave_drive/core/shared/widgets/dialogs/request_permission_dialog.dart';


class PermissionHandlerService {
  final appPermissions = [
    Permission.camera,
    Permission.audio,
    Permission.photos,
    Permission.microphone,
    Permission.notification,
  ];

  final liveStreamPermissions = [Permission.camera, Permission.microphone];

  final galleryPermissions = [
    if (Platform.isAndroid) Permission.videos,
    Permission.photos,
  ];

  final initPermissions = [Permission.notification];

  Future<bool> isPermissionGranted(Permission per) async {
    final status = await per.status;
    return [
      PermissionStatus.granted,
      PermissionStatus.limited,
    ].contains(status);
  }

  Future<void> printAllPermissionStatus() async {
    final statusList = await Future.wait(
      appPermissions.map((e) => e.status).toList(),
    );
    final statusMap = Map.fromEntries(
      appPermissions.asMap().entries.map(
        (entry) => MapEntry(entry.value, statusList[entry.key]),
      ),
    );

    AppLogger.d('[PERMISSIONS] - $statusMap');
  }

  Future<void> requestAppTransparency() async {
    if (!Platform.isIOS) return;
    await AppTrackingTransparency.requestTrackingAuthorization();
  }

  Future<void> requestInitPermission() async {
    await initPermissions.request();
  }

  Future<void> requestMissingLivePermission() async {
    await liveStreamPermissions.request();
  }



  Future<bool> hasLivePermissions() async {
    for (final permission in liveStreamPermissions) {
      if (!await isPermissionGranted(permission)) {
        return false;
      }
    }
    return true;
  }

  Future<bool> requestAudioLivePermission() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final permissions = await [
        ...liveStreamPermissions,
        if (androidInfo.version.sdkInt >= 33) Permission.audio,
      ].request();
      return permissions.values.every(
        (element) => element.isGranted || element.isLimited,
      );
    }

    final permissions = await liveStreamPermissions.request();
    return permissions.values.every(
      (element) => element.isGranted || element.isLimited,
    );
  }

  Future<bool> requestGallery() async {
    if (Platform.isIOS) {
      final result = await Permission.photos.request();
      return result.isGranted || result.isLimited;
    }

    final deviceInfo = await DeviceInfoPlugin().androidInfo;

    if (deviceInfo.version.sdkInt > 32) {
      final result = await Permission.videos.request();
      return result.isGranted || result.isLimited;
    } else {
      final result = await Permission.storage.request();
      return result.isGranted || result.isLimited;
    }
  }

  Future<bool> hasGalleryPermissions() async {
    for (final permission in galleryPermissions) {
      if (!await isPermissionGranted(permission)) {
        return false;
      }
    }
    return true;
  }

  Future<bool> requestPhotos() async {
    if (Platform.isAndroid) {
      return true;
    }
    final status = await Permission.photos.request();
    return status.isGranted || status.isLimited;
  }

  Future<bool> requestVideos() async {
    if (Platform.isAndroid) {
      return await requestPhotos();
    }

    final status = await Permission.videos.request();
    return status.isGranted || status.isLimited;
  }

  Future<bool> requestCamera() async {
    final status = await Permission.camera.request();
    return status.isGranted || status.isLimited;
  }

  Future<bool> checkStoragePermission() async {
    if (Platform.isIOS) {
      return true;
    }

    if (Platform.isAndroid) {
      final result = await Permission.storage.request();
      return result == PermissionStatus.granted;
    }

    throw StateError('unknown platform');
  }

  Future<bool> checkStorageAudioPermission() async {
    if (Platform.isIOS) {
      return true;
    }

    if (Platform.isAndroid) {
      final result = await Permission.audio.request();
      return result == PermissionStatus.granted;
    }

    throw StateError('unknown platform');
  }

  Future<bool> checkLivePermission(BuildContext context) async {
    await requestMissingLivePermission();
    if (!await hasLivePermissions()) {
      if (context.mounted) {
        RequestPermissionDialog.show(
          context,
          title: '"RB Live" would like to access your camera and microphone',
          description:
              'Granting storage access allows this app to live stream. Enable these permissions in your device settings.',
        );
      }
      return false;
    }
    return true;
  }

  final List<Permission> audioLoadPermissions = [
    if (Platform.isAndroid) ...[
      Permission.storage, // For Android < 13
    ] else if (Platform.isIOS) ...[
      Permission.mediaLibrary, // Optional: For iOS
    ],
  ];

  Future<bool> hasAudioLoadPermissions() async {
    for (final permission in audioLoadPermissions) {
      if (!await permission.isGranted) {
        return false;
      }
    }

    // Also check Permission.audio for Android 13+
    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        if (!await Permission.audio.isGranted) {
          return false;
        }
      }
    }

    return true;
  }

  Future<bool> requestAudioLoadPermissions() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      final permissionsToRequest = [
        ...audioLoadPermissions,
        if (androidInfo.version.sdkInt >= 33) Permission.audio,
      ];

      final results = await permissionsToRequest.request();
      return results.values.every((p) => p.isGranted || p.isLimited);
    }

    final results = await audioLoadPermissions.request();
    return results.values.every((p) => p.isGranted || p.isLimited);
  }


  // for permission 
  Future<void> requestMissingLocationPermission() async {
  final status = await Permission.location.status;

  if (status.isDenied || status.isPermanentlyDenied) {
    await Permission.location.request();
  }
}
Future<bool> hasLocationPermission() async {
  return await Permission.location.isGranted;
}

}
