part of 'requests.dart';

@JsonSerializable(createFactory: false)
class CreateTicketRequest {
  final String propertyId;
  final String titleId;
  final String description;
  final List<String> attachments;

  CreateTicketRequest({
    required this.propertyId,
    required this.titleId,
    required this.description,
    required this.attachments,
  });

  Map<String, dynamic> toJson() => _$CreateTicketRequestToJson(this);
}
