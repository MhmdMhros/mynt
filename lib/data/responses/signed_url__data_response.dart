part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class SignedUrlDataResponse extends Equatable
    implements DataResponse<SignedUrlData> {
  final String? id;
  final String? signature;

  const SignedUrlDataResponse({
    required this.id,
    required this.signature,
  });

  @override
  SignedUrlData toDomain() {
    return SignedUrlData(
      id: id.orEmpty(),
      signedUrl: signature.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [id, signature];

  factory SignedUrlDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SignedUrlDataResponseFromJson(json);
}
