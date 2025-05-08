part of 'requests.dart';

@JsonSerializable(createFactory: false)
class GetUserRequest {
  final String token;

  GetUserRequest({
    required this.token,
  });

  Map<String, dynamic> toJson() => _$GetUserRequestToJson(this);
}
