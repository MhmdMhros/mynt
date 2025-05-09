part of 'requests.dart';

@JsonSerializable(createFactory: false)
class EditEmailRequest {
  final String email;

  EditEmailRequest({
    required this.email,
  });

  Map<String, dynamic> toJson() => _$EditEmailRequestToJson(this);
}
