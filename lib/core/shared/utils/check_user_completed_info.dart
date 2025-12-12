


import 'package:wave_drive/core/data/models/auth/user_model.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';

bool isUserCompletedInfo(UserModel? user) {
  if (user == null) {
    return false;
  }

  try {
    return user.firstName.isNotNullOrEmpty &&
        user.lastName.isNotNullOrEmpty &&
        (user.email.isNotNullOrEmpty);
  } catch (_) {
    return false;
  }
}



// check name
bool isCreatedName(UserModel? user) {
  if (user == null) {
    return false;
  }
  try {
    return user.firstName.isNotNullOrEmpty && user.lastName.isNotNullOrEmpty;
  } catch (_) {
    return false;
  }
}

bool isCreatedEmail(UserModel? user) {
  if (user == null) {
    return false;
  }
  try {
    return user.email.isNotNullOrEmpty;
  } catch (_) {
    return false;
  }
}
