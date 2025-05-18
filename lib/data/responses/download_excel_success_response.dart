part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class DownloadExcelSuccessResponse extends Equatable
    implements DataResponse<DownloadExcelSuccess> {
  final String? url;

  const DownloadExcelSuccessResponse({
    required this.url,
  });

  @override
  DownloadExcelSuccess toDomain() {
    return DownloadExcelSuccess(url: url.orEmpty());
  }

  @override
  List<Object?> get props => [url];

  factory DownloadExcelSuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$DownloadExcelSuccessResponseFromJson(json);
  }
}
