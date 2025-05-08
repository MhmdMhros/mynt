part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ForgetPasswordSuccessResponse extends Equatable
    implements DataResponse<ForgetPasswordSuccess> {
  final String? message;

  const ForgetPasswordSuccessResponse({
    required this.message,
  });

  @override
  ForgetPasswordSuccess toDomain() {
    return ForgetPasswordSuccess(message: message.orEmpty());
  }

  @override
  List<Object?> get props => [message];

  factory ForgetPasswordSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordSuccessResponseFromJson(json);
}
