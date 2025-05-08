part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class BodyPhotosDataResponse extends Equatable
    implements DataResponse<BodyPhotosData> {
  final List<BodyPhotoResponse>? bodyPhotos;
  final int? total;

  const BodyPhotosDataResponse({
    required this.bodyPhotos,
    required this.total,
  });

  @override
  BodyPhotosData toDomain() {
    return BodyPhotosData(
        bodyPhotos: bodyPhotos?.map((item) => item.toDomain()).toList() ?? [],
        total: total.orZero());
  }

  @override
  List<Object?> get props => [bodyPhotos, total];

  factory BodyPhotosDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyPhotosDataResponseFromJson({
        ...json['payload']['data'],
        ...json['payload']['pagination'],
      });
}
