
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


// part 'api_service.g.dart';
part 'services/auth.dart';
part 'services/user.dart';
 part 'api_service.g.dart';



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
