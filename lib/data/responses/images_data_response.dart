part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ImagesDataResponse extends Equatable implements DataResponse<ImagesData> {
  final List<UploadedImageDataResponse>? uploaded;

  const ImagesDataResponse({
    required this.uploaded,
  });

  @override
  ImagesData toDomain() {
    return ImagesData(
      uploadedImagesData: uploaded?.map((e) => e.toDomain()).toList() ?? [],
    );
  }

  @override
  List<Object?> get props => [uploaded];

  factory ImagesDataResponse.fromJson(Map<String, dynamic> json) {
    return _$ImagesDataResponseFromJson(json);
  }
}
