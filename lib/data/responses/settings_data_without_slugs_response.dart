part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class SettingsDataWithoutSlugsResponse extends Equatable
    implements DataResponse<SettingsDataWithoutSlug> {
  final GeneralInfoResponse? general;
  @JsonKey(name: 'social_media')
  final SocialMediaResponse? socialMedia;
  final CustomersResponse? customers;
  @JsonKey(name: 'social_auth')
  final SocialAuthResponse? socialAuth;
  final DriversResponse? drivers;

  const SettingsDataWithoutSlugsResponse({
    required this.general,
    required this.socialMedia,
    required this.customers,
    required this.socialAuth,
    required this.drivers,
  });

  factory SettingsDataWithoutSlugsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SettingsDataWithoutSlugsResponseFromJson(json);

  @override
  SettingsDataWithoutSlug toDomain() {
    return SettingsDataWithoutSlug(
      general: general?.toDomain(),
      socialMedia: socialMedia?.toDomain(),
      customers: customers?.toDomain(),
      socialAuth: socialAuth?.toDomain(),
      drivers: drivers?.toDomain(),
    );
  }

  @override
  List<Object?> get props =>
      [general, socialMedia, customers, socialAuth, drivers];
}

@JsonSerializable(createToJson: false)
class GeneralInfoResponse extends Equatable
    implements DataResponse<GeneralInfo> {
  @JsonKey(name: 'app_name')
  final String? appName;
  final String? address;
  final String? email;
  final String? phone;
  final String? hotline;
  final String? whatsapp;
  @JsonKey(name: 'customer_hotline')
  final String? customerHotline;
  @JsonKey(name: 'owner_hotline')
  final String? ownerHotline;
  @JsonKey(name: 'customer_whatsapp')
  final String? customerWhatsapp;
  @JsonKey(name: 'owner_whatsapp')
  final String? ownerWhatsapp;
  @JsonKey(name: 'call_police')
  final String? callPolice;
  @JsonKey(name: 'call_ambulance')
  final String? callAmbulance;
  @JsonKey(name: 'download_customer_app_url')
  final String? downloadCustomerAppUrl;
  @JsonKey(name: 'download_owner_app_url')
  final String? downloadOwnerAppUrl;

  const GeneralInfoResponse({
    required this.appName,
    required this.address,
    required this.email,
    required this.phone,
    required this.hotline,
    required this.whatsapp,
    required this.customerHotline,
    required this.ownerHotline,
    required this.customerWhatsapp,
    required this.ownerWhatsapp,
    required this.callPolice,
    required this.callAmbulance,
    required this.downloadCustomerAppUrl,
    required this.downloadOwnerAppUrl,
  });

  @override
  GeneralInfo toDomain() {
    return GeneralInfo(
      appName: appName,
      address: address,
      email: email,
      phone: phone,
      hotline: hotline,
      whatsapp: whatsapp,
      customerHotline: customerHotline,
      ownerHotline: ownerHotline,
      customerWhatsapp: customerWhatsapp,
      ownerWhatsapp: ownerWhatsapp,
      callPolice: callPolice,
      callAmbulance: callAmbulance,
      downloadCustomerAppUrl: downloadCustomerAppUrl,
      downloadOwnerAppUrl: downloadOwnerAppUrl,
    );
  }

  @override
  List<Object?> get props => [
        appName,
        address,
        email,
        phone,
        hotline,
        whatsapp,
        customerHotline,
        ownerHotline,
        customerWhatsapp,
        ownerWhatsapp,
        callPolice,
        callAmbulance,
        downloadCustomerAppUrl,
        downloadOwnerAppUrl,
      ];

  factory GeneralInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralInfoResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class SocialMediaResponse extends Equatable
    implements DataResponse<SocialMedia> {
  @JsonKey(name: 'twitter_url')
  final String? twitterUrl;
  @JsonKey(name: 'facebook_url')
  final String? facebookUrl;
  @JsonKey(name: 'youtube_url')
  final String? youtubeUrl;
  @JsonKey(name: 'instagram_url')
  final String? instagramUrl;

  const SocialMediaResponse({
    required this.twitterUrl,
    required this.facebookUrl,
    required this.youtubeUrl,
    required this.instagramUrl,
  });

  @override
  SocialMedia toDomain() {
    return SocialMedia(
      twitterUrl: twitterUrl,
      facebookUrl: facebookUrl,
      youtubeUrl: youtubeUrl,
      instagramUrl: instagramUrl,
    );
  }

  @override
  List<Object?> get props =>
      [twitterUrl, facebookUrl, youtubeUrl, instagramUrl];

  factory SocialMediaResponse.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class SocialAuthResponse extends Equatable implements DataResponse<SocialAuth> {
  @JsonKey(name: 'facebook_status')
  final String? facebookStatus;
  @JsonKey(name: 'google_status')
  final String? googleStatus;
  @JsonKey(name: 'apple_status')
  final String? appleStatus;

  const SocialAuthResponse({
    required this.facebookStatus,
    required this.googleStatus,
    required this.appleStatus,
  });

  @override
  SocialAuth toDomain() {
    return SocialAuth(
      facebookStatus: facebookStatus,
      googleStatus: googleStatus,
      appleStatus: appleStatus,
    );
  }

  @override
  List<Object?> get props => [facebookStatus, googleStatus, appleStatus];

  factory SocialAuthResponse.fromJson(Map<String, dynamic> json) =>
      _$SocialAuthResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class DriversResponse extends Equatable implements DataResponse<Drivers> {
  @JsonKey(name: 'enable_phone_otp')
  final String? enablePhoneOtp;

  const DriversResponse({required this.enablePhoneOtp});

  @override
  Drivers toDomain() => Drivers(enablePhoneOtp: enablePhoneOtp);

  @override
  List<Object?> get props => [enablePhoneOtp];

  factory DriversResponse.fromJson(Map<String, dynamic> json) =>
      _$DriversResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class CustomersResponse extends Equatable implements DataResponse<Customers> {
  @JsonKey(name: 'enable_phone_otp')
  final String? enablePhoneOtp;

  const CustomersResponse({required this.enablePhoneOtp});

  @override
  Customers toDomain() => Customers(enablePhoneOtp: enablePhoneOtp);

  @override
  List<Object?> get props => [enablePhoneOtp];

  factory CustomersResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomersResponseFromJson(json);
}
