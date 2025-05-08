part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class SignedUrlResponse extends Equatable implements DataResponse<SignedUrl> {
  final SignedUrlDataResponse? video;
  final SignedUrlDataResponse? thumbnail;

  const SignedUrlResponse({
    required this.video,
    required this.thumbnail,
  });

  @override
  SignedUrl toDomain() {
    return SignedUrl(
      video: video?.toDomain(),
      thumbnail: thumbnail?.toDomain(),
    );
  }

  @override
  List<Object?> get props => [
        video,
        thumbnail,
      ];

  factory SignedUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$SignedUrlResponseFromJson(json['payload']['data']);
}
