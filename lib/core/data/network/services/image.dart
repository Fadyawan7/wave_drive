part of '../api_service.dart';

@RestApi()
abstract class ImageAPIService {
  factory ImageAPIService(Dio dio, {String? baseUrl}) = _ImageAPIService;

  @POST('/upload-file')
  @MultiPart()
  Future<UploadImageResponse> uploadFile(
    @Part(name: 'file') File image,
    @SendProgress() ProgressCallback sendProgress,
  );



}
