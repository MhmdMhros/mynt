part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ResetPasswordSuccessResponse extends Equatable
    implements DataResponse<ResetPasswordSuccess> {
  final String? message;

  const ResetPasswordSuccessResponse({
    required this.message,
  });

  @override
  ResetPasswordSuccess toDomain() {
    return ResetPasswordSuccess(message: message.orEmpty());
  }

  @override
  List<Object?> get props => [message];

  factory ResetPasswordSuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordSuccessResponseFromJson(json);
  }
}
