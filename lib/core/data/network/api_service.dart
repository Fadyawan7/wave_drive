import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wave_drive/core/data/models/auth/siginin_dto.dart';
import 'package:wave_drive/core/data/models/auth/sign_in_response.dart';
import 'package:wave_drive/core/data/models/auth/user_model.dart';
import 'package:wave_drive/core/data/models/earning/earning_model.dart';
import 'package:wave_drive/core/data/models/user/check_phone_number_exist.dart';
import 'package:wave_drive/core/data/network/dio/payment_info_dto.dart';
import 'package:wave_drive/core/data/network/dio/update_profile_dto.dart';
import 'package:wave_drive/core/data/network/dio/update_vehicle_info_dto.dart';
import 'package:wave_drive/core/data/network/dio/upload/upload_image_response.dart';

// part 'api_service.g.dart';
part 'services/auth.dart';
part 'services/user.dart';
part 'services/image.dart';
part 'api_service.g.dart';

class ApiService {
  ApiService(this.dio, {this.baseUrl}) {
    auth = AuthAPIService(dio);

    user = UserAPIService(dio);
    image = ImageAPIService(dio);
  }

  final Dio dio;
  final String? baseUrl;

  late final AuthAPIService auth;

  late final UserAPIService user;
  late final ImageAPIService image;
}
