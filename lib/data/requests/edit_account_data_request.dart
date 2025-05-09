part of 'requests.dart';

@JsonSerializable(createFactory: false)
class EditAccountDataRequest {
  final String name;
  final String gender; // 1 => male  2 => female
  final String birthDate;

  EditAccountDataRequest({
    required this.name,
    required this.gender,
    required this.birthDate,
  });

  Map<String, dynamic> toJson() => _$EditAccountDataRequestToJson(this);
}
