import 'package:wave_drive/core/data/models/auth/user_model.dart';
import 'package:wave_drive/core/shared/extensions/extensions.dart';

bool isUserCompletedFullInfo(UserModel? user) {
  if (user == null) {
    return false;
  }

  try {
    return user.firstName.isNotNullOrEmpty &&
        user.lastName.isNotNullOrEmpty &&
        // user.nationalId.isNotNullOrEmpty &&
        // user.language.isNotNullOrEmpty &&
        (user.driverDocument != null) &&
        (user.vehicle != null) &&
        (user.paymentDetail != null);
  } catch (_) {
    return false;
  }
}



bool isUserCompletedOnlyInfo(UserModel? user) {
  if (user == null) {
    return false;
  }

  try {
    return user.firstName.isNotNullOrEmpty &&
        user.lastName.isNotNullOrEmpty &&
        user.nationalId.isNotNullOrEmpty &&
        user.language.isNotNullOrEmpty &&

         (user.driverDocument == null) &&
        (user.vehicle == null) &&
        (user.paymentDetail == null);
      
  } catch (_) {
    return false;
  }
}




bool isUserCompletedVehicleInfo(UserModel? user) {
  if (user == null) {
    return false;
  }

  try {
    return user.firstName.isNotNullOrEmpty &&
        user.lastName.isNotNullOrEmpty &&
        user.nationalId.isNotNullOrEmpty &&
        user.language.isNotNullOrEmpty &&
       
        (user.vehicle != null) ;
      
  } catch (_) {
    return false;
  }
}





bool isUserCompletedDocumentInfo(UserModel? user) {
  if (user == null) {
    return false;
  }

  try {
    return user.firstName.isNotNullOrEmpty &&
        user.lastName.isNotNullOrEmpty &&
        user.nationalId.isNotNullOrEmpty &&
        user.language.isNotNullOrEmpty &&
       
        (user.driverDocument != null) &&
        (user.vehicle != null) ;
      
  } catch (_) {
    return false;
  }
}


bool isUserCompletedPaymentInfo(UserModel? user) {
  if (user == null) {
    return false;
  }

  try {
    return user.firstName.isNotNullOrEmpty &&
        user.lastName.isNotNullOrEmpty &&
        user.nationalId.isNotNullOrEmpty &&
        user.language.isNotNullOrEmpty &&
       
        (user.paymentDetail != null) ;
      
  } catch (_) {
    return false;
  }
}




