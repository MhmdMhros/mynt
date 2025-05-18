part of 'requests.dart';

@JsonSerializable(createFactory: false)
class EditAccountDataRequest {
  final String name;
  final String gender; // 1 => male  2 => female

  EditAccountDataRequest({
    required this.name,
    required this.gender,
  });

  Map<String, dynamic> toJson() => _$EditAccountDataRequestToJson(this);
}
