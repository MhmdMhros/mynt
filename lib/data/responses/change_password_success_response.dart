part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ChangePasswordSuccessResponse extends Equatable
    implements DataResponse<ChangePasswordSuccess> {
  final String? message;

  const ChangePasswordSuccessResponse({
    required this.message,
  });

  @override
  ChangePasswordSuccess toDomain() {
    return ChangePasswordSuccess(message: message.orEmpty());
  }

  @override
  List<Object?> get props => [message];

  factory ChangePasswordSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$ChangePasswordSuccessResponseFromJson(json);
}
