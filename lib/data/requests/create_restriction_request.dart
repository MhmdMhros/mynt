part of 'requests.dart';

@JsonSerializable(createFactory: false)
class CreateRestrictionRequest {
  final String propertyId;
  final String dateFrom;
  final String dateTo;

  CreateRestrictionRequest({
    required this.propertyId,
    required this.dateFrom,
    required this.dateTo,
  });

  Map<String, dynamic> toJson() => _$CreateRestrictionRequestToJson(this);
}
