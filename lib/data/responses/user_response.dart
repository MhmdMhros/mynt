part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class UserResponse extends Equatable implements DataResponse<User> {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final int? gender;
  @JsonKey(name: 'birthdate')
  final String? birthDate;
  final String? locale;
  @JsonKey(name: 'commission_value')
  final String? commissionValue;
  @JsonKey(name: 'commission_type')
  final int? commissionType;
  @JsonKey(name: 'status_id')
  final int? statusId;
  @JsonKey(name: 'status_text')
  final String? statusText;
  @JsonKey(name: 'status_slug')
  final String? statusSlug;
  final int? balance;
  final UserResponse? provider;

  const UserResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.gender,
    required this.birthDate,
    required this.locale,
    required this.commissionValue,
    required this.commissionType,
    required this.statusId,
    required this.statusText,
    required this.statusSlug,
    required this.balance,
    required this.provider,
  });

  @override
  User toDomain() {
    return User(
      id: id ?? 0,
      name: name.orEmpty(),
      email: email.orEmpty(),
      phone: phone.orEmpty(),
      gender: gender ?? 0,
      birthDate: birthDate.orEmpty(),
      locale: locale.orEmpty(),
      commissionValue: commissionValue.orEmpty(),
      commissionType: commissionType ?? 0,
      statusId: statusId ?? 0,
      statusText: statusText.orEmpty(),
      statusSlug: statusSlug.orEmpty(),
      balance: balance ?? 0,
      provider: provider?.toDomain(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phone,
        gender,
        birthDate,
        locale,
        commissionValue,
        commissionType,
        statusId,
        statusText,
        statusSlug,
        balance,
        provider,
      ];

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }
}
