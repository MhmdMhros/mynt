part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class TicketResponse extends Equatable implements DataResponse<Ticket> {
  final int? id;
  @JsonKey(name: 'property_title')
  final String? propertyTitle;
  @JsonKey(name: 'property_number')
  final String? propertyNumber;
  @JsonKey(name: 'property_building')
  final String? propertyBuilding;
  @JsonKey(name: 'customer_name')
  final String? customerName;
  @JsonKey(name: 'customer_phone')
  final String? customerPhone;
  @JsonKey(name: 'owner_name')
  final String? ownerName;
  @JsonKey(name: 'owner_phone')
  final String? ownerPhone;
  final String? title;
  final String? description;
  @JsonKey(name: 'status_id')
  final int? statusId;
  @JsonKey(name: 'status_text')
  final String? statusText;
  @JsonKey(name: 'creation_date')
  final String? creationDate;
  @JsonKey(name: 'creation_time')
  final String? creationTime;
  final List<String>? gallery;

  const TicketResponse({
    required this.id,
    required this.propertyTitle,
    required this.propertyNumber,
    required this.propertyBuilding,
    required this.customerName,
    required this.customerPhone,
    required this.ownerName,
    required this.ownerPhone,
    required this.title,
    required this.description,
    required this.statusId,
    required this.statusText,
    required this.creationDate,
    required this.creationTime,
    required this.gallery,
  });

  @override
  Ticket toDomain() {
    return Ticket(
      id: id.orZero(),
      propertyTitle: propertyTitle.orEmpty(),
      propertyNumber: propertyNumber.orEmpty(),
      propertyBuilding: propertyBuilding.orEmpty(),
      customerName: customerName.orEmpty(),
      customerPhone: customerPhone.orEmpty(),
      ownerName: ownerName.orEmpty(),
      ownerPhone: ownerPhone.orEmpty(),
      title: title.orEmpty(),
      description: description.orEmpty(),
      statusId: statusId.orZero(),
      statusText: statusText.orEmpty(),
      creationDate: creationDate.orEmpty(),
      creationTime: creationTime.orEmpty(),
      gallery: gallery ?? [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        propertyTitle,
        propertyNumber,
        propertyBuilding,
        customerName,
        customerPhone,
        ownerName,
        ownerPhone,
        title,
        description,
        statusText,
        creationDate,
        creationTime,
        gallery,
      ];

  factory TicketResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketResponseFromJson(json);
}
