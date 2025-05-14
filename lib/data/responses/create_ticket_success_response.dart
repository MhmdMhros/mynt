part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class CreateTicketSuccessResponse extends Equatable
    implements DataResponse<CreateTicketSuccess> {
  final String? message;

  const CreateTicketSuccessResponse({
    required this.message,
  });

  @override
  CreateTicketSuccess toDomain() {
    return CreateTicketSuccess(message: message.orEmpty());
  }

  @override
  List<Object?> get props => [message];

  factory CreateTicketSuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$CreateTicketSuccessResponseFromJson(json);
  }
}
