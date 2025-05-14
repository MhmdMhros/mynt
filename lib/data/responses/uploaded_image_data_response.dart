part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class UploadedImageDataResponse extends Equatable
    implements DataResponse<UploadedImageData> {
  final int? id;
  @JsonKey(name: 'file_name')
  final String? fileName;
  final String? dir;
  @JsonKey(name: 'mime_type')
  final String? mimeType;
  final String? url;
  @JsonKey(name: 'upload_path')
  final String? uploadPath;
  final String? background;
  final String? field;

  const UploadedImageDataResponse({
    required this.id,
    required this.fileName,
    required this.dir,
    required this.mimeType,
    required this.url,
    required this.uploadPath,
    required this.background,
    required this.field,
  });

  @override
  UploadedImageData toDomain() {
    return UploadedImageData(
      id: id.orZero(),
      fileName: fileName.orEmpty(),
      dir: dir.orEmpty(),
      mimeType: mimeType.orEmpty(),
      url: url.orEmpty(),
      uploadPath: uploadPath.orEmpty(),
      background: background.orEmpty(),
      field: field.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        fileName,
        dir,
        mimeType,
        url,
        uploadPath,
        background,
        field,
      ];

  factory UploadedImageDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadedImageDataResponseFromJson(json);
}
