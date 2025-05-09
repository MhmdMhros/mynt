part of 'requests.dart';

@JsonSerializable(createFactory: false)
class EditPhoneRequest {
  final String phoneNumber;
  EditPhoneRequest({
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$EditPhoneRequestToJson(this);
}
