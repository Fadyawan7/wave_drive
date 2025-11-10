import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:wave_drive/core/configs/app_config.dart';
import 'package:wave_drive/core/data/models/auth/login/sigin_dto.dart';
import 'package:wave_drive/core/data/models/auth/siginin_dto.dart';
import 'package:wave_drive/core/data/models/auth/signup/signup_email_dto.dart';
import 'package:wave_drive/core/data/models/auth/user_model.dart';
import 'package:wave_drive/core/data/models/auth/varify_otp_dto.dart';


// part 'api_service.g.dart';
part 'services/auth.dart';
part 'services/user.dart';



class ApiService {
  ApiService(this.dio, {this.baseUrl}) {
    // auth = AuthAPIService(dio);
 
    // user = UserAPIService(dio);
  
  }

  final Dio dio;
  final String? baseUrl;

  late final AuthAPIService auth;

  late final UserAPIService user;
  

}
