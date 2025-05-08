// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  final String? name;
  final String? email;
  final String? phone;
  final int? gender;
  final String? birthDate;
  final String? locale;
  final String? commissionValue;
  final int? commissionType;
  final int? statusId;
  final String? statusText;
  final String? statusSlug;
  final double? balance;
  final User? provider;

  User({
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

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    int? gender,
    String? birthDate,
    String? locale,
    String? commissionValue,
    int? commissionType,
    int? statusId,
    String? statusText,
    String? statusSlug,
    double? balance,
    User? provider,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      locale: locale ?? this.locale,
      commissionValue: commissionValue ?? this.commissionValue,
      commissionType: commissionType ?? this.commissionType,
      statusId: statusId ?? this.statusId,
      statusText: statusText ?? this.statusText,
      statusSlug: statusSlug ?? this.statusSlug,
      balance: balance ?? this.balance,
      provider: provider ?? this.provider,
    );
  }
}
