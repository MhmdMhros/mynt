part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class BodyPhotoResponse extends Equatable implements DataResponse<BodyPhoto> {
  final String? id;
  final String? photoUrl;
  final String? type;
  final String? createdAt;

  const BodyPhotoResponse({
    required this.id,
    required this.photoUrl,
    required this.type,
    required this.createdAt,
  });

  @override
  BodyPhoto toDomain() {
    return BodyPhoto(
      id: id.orEmpty(),
      photoUrl: photoUrl.orEmpty(),
      type: type.orEmpty(),
      createdAt: createdAt.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [id, photoUrl, createdAt, createdAt];

  factory BodyPhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyPhotoResponseFromJson(json);
}
