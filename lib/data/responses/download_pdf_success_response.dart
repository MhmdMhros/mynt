part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class DownloadPdfSuccessResponse extends Equatable
    implements DataResponse<DownloadPdfSuccess> {
  final String? url;

  const DownloadPdfSuccessResponse({
    required this.url,
  });

  @override
  DownloadPdfSuccess toDomain() {
    return DownloadPdfSuccess(url: url.orEmpty());
  }

  @override
  List<Object?> get props => [url];

  factory DownloadPdfSuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$DownloadPdfSuccessResponseFromJson(json);
  }
}
