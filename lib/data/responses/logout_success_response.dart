part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class LogoutSuccessResponse extends Equatable
    implements DataResponse<LogoutSuccess> {
  final String? message;

  const LogoutSuccessResponse({
    required this.message,
  });

  @override
  LogoutSuccess toDomain() {
    return LogoutSuccess(message: message.orEmpty());
  }

  @override
  List<Object?> get props => [message];

  factory LogoutSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutSuccessResponseFromJson(json);
}
