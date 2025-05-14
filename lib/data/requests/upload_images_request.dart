part of 'requests.dart';

class UploadImagesRequest {
  final String name;
  final List<File> files;

  UploadImagesRequest({
    required this.name,
    required this.files,
  });

  Map<String, dynamic> toJson() => _$UploadImagesRequestToJson(this);
}
