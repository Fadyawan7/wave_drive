part of '../api_service.dart';

@RestApi()
abstract class ImageAPIService {
  factory ImageAPIService(Dio dio, {String? baseUrl}) = _ImageAPIService;

  @POST('/image')
  @MultiPart()
  Future<UploadImageResponse> uploadImage(
    @Part(name: 'image') File image,
    @SendProgress() ProgressCallback sendProgress,
  );



}
