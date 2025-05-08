part of 'requests.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class UpdateUserRequest {
  final String? firstName;
  final String? lastName;
  final String? businessName;
  final String? phoneNumber;
  final String? about;
  final String? trainingSince;
  final List<String>? servicesOffered;
  final String? gender;
  final String? email;
  final String? city;
  @JsonKey(name: 'coachId')
  final String id;
  @JsonKey(includeToJson: false)
  final File? photo;
  @JsonKey(includeToJson: false)
  final File? cover;

  UpdateUserRequest({
    this.servicesOffered,
    this.trainingSince,
    this.firstName,
    this.lastName,
    this.city,
    this.gender,
    this.email,
    this.about,
    this.businessName,
    this.phoneNumber,
    this.photo,
    this.cover,
    required this.id,
  });

  Map<String, dynamic> toJson() => _$UpdateUserRequestToJson(this);
}
