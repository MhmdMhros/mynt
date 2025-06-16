class SettingsDataWithoutSlug {
  final GeneralInfo? general;
  final SocialMedia? socialMedia;
  final Customers? customers;
  final SocialAuth? socialAuth;
  final Owners? owners;

  SettingsDataWithoutSlug({
    required this.general,
    required this.socialMedia,
    required this.customers,
    required this.socialAuth,
    required this.owners,
  });

  Map<String, dynamic> toJson() {
    return {
      'general': general?.toJson(),
      'social_media': socialMedia?.toJson(),
      'customers': customers?.toJson(),
      'social_auth': socialAuth?.toJson(),
      'owners': owners?.toJson(),
    };
  }

  @override
  String toString() {
    return 'SettingsDataWithoutSlug(general: $general, socialMedia: $socialMedia, customers: $customers, socialAuth: $socialAuth, owners: $owners)';
  }
}

class GeneralInfo {
  final String? appName;
  final String? address;
  final String? email;
  final String? phone;
  final String? hotline;
  final String? whatsapp;
  final String? customerHotline;
  final String? ownerHotline;
  final String? customerWhatsapp;
  final String? ownerWhatsapp;
  final String? callPolice;
  final String? callAmbulance;
  final String? downloadCustomerAppUrl;
  final String? downloadOwnerAppUrl;

  GeneralInfo({
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

  Map<String, dynamic> toJson() {
    return {
      'app_name': appName,
      'address': address,
      'email': email,
      'phone': phone,
      'hotline': hotline,
      'whatsapp': whatsapp,
      'customer_hotline': customerHotline,
      'owner_hotline': ownerHotline,
      'customer_whatsapp': customerWhatsapp,
      'owner_whatsapp': ownerWhatsapp,
      'call_police': callPolice,
      'call_ambulance': callAmbulance,
      'download_customer_app_url': downloadCustomerAppUrl,
      'download_owner_app_url': downloadOwnerAppUrl,
    };
  }

  @override
  String toString() {
    return 'GeneralInfo(appName: $appName, address: $address, email: $email, phone: $phone, hotline: $hotline, whatsapp: $whatsapp, customerHotline: $customerHotline, ownerHotline: $ownerHotline, customerWhatsapp: $customerWhatsapp, ownerWhatsapp: $ownerWhatsapp, callPolice: $callPolice, callAmbulance: $callAmbulance, downloadCustomerAppUrl: $downloadCustomerAppUrl, downloadOwnerAppUrl: $downloadOwnerAppUrl)';
  }
}

class SocialMedia {
  final String? twitterUrl;
  final String? facebookUrl;
  final String? youtubeUrl;
  final String? instagramUrl;
  final String? tiktokUrl;

  SocialMedia({
    required this.twitterUrl,
    required this.facebookUrl,
    required this.youtubeUrl,
    required this.instagramUrl,
    required this.tiktokUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'twitter_url': twitterUrl,
      'facebook_url': facebookUrl,
      'youtube_url': youtubeUrl,
      'instagram_url': instagramUrl,
      'tiktok_url': tiktokUrl,
    };
  }

  @override
  String toString() {
    return 'SocialMedia(twitterUrl: $twitterUrl, facebookUrl: $facebookUrl, youtubeUrl: $youtubeUrl, instagramUrl: $instagramUrl, tiktokUrl: $tiktokUrl)';
  }
}

class SocialAuth {
  final String? facebookStatus;
  final String? googleStatus;
  final String? appleStatus;

  SocialAuth({
    required this.facebookStatus,
    required this.googleStatus,
    required this.appleStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'facebook_status': facebookStatus,
      'google_status': googleStatus,
      'apple_status': appleStatus,
    };
  }

  @override
  String toString() {
    return 'SocialAuth(facebookStatus: $facebookStatus, googleStatus: $googleStatus, appleStatus: $appleStatus)';
  }
}

class Owners {
  final String? enablePhoneOtp;
  Owners({
    required this.enablePhoneOtp,
  });

  Map<String, dynamic> toJson() {
    return {
      'enable_phone_otp': enablePhoneOtp,
    };
  }

  @override
  String toString() {
    return 'owners(enablePhoneOtp: $enablePhoneOtp)';
  }
}

class Customers {
  final String? enablePhoneOtp;
  Customers({
    required this.enablePhoneOtp,
  });

  Map<String, dynamic> toJson() {
    return {
      'enable_phone_otp': enablePhoneOtp,
    };
  }

  @override
  String toString() {
    return 'Customers(enablePhoneOtp: $enablePhoneOtp)';
  }
}
