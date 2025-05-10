part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class SettingsDataResponse extends Equatable
    implements DataResponse<SettingsData> {
  @JsonKey(name: 'about_us_content')
  final String? aboutUsContent;

  @JsonKey(name: 'terms_content')
  final String? termsContent;

  @JsonKey(name: 'privacy_content')
  final String? privacyContent;

  @JsonKey(name: 'copyright_content')
  final String? copyrightContent;

  @JsonKey(name: 'delete_account_content')
  final String? deleteAccountContent;

  @JsonKey(name: 'plans_subscriptions_terms_content')
  final String? plansSubscriptionsTermsContent;

  @JsonKey(name: 'payment_terms_content')
  final String? paymentTermsContent;

  @JsonKey(name: 'about_us_content_text')
  final String? aboutUsContentText;

  @JsonKey(name: 'terms_content_text')
  final String? termsContentText;

  @JsonKey(name: 'privacy_content_text')
  final String? privacyContentText;

  @JsonKey(name: 'copyright_content_text')
  final String? copyrightContentText;

  @JsonKey(name: 'delete_account_content_text')
  final String? deleteAccountContentText;

  @JsonKey(name: 'plans_subscriptions_terms_content_text')
  final String? plansSubscriptionsTermsContentText;

  @JsonKey(name: 'payment_terms_content_text')
  final String? paymentTermsContentText;

  const SettingsDataResponse({
    required this.aboutUsContent,
    required this.termsContent,
    required this.privacyContent,
    required this.copyrightContent,
    required this.deleteAccountContent,
    required this.plansSubscriptionsTermsContent,
    required this.paymentTermsContent,
    required this.aboutUsContentText,
    required this.termsContentText,
    required this.privacyContentText,
    required this.copyrightContentText,
    required this.deleteAccountContentText,
    required this.plansSubscriptionsTermsContentText,
    required this.paymentTermsContentText,
  });

  @override
  SettingsData toDomain() {
    return SettingsData(
      aboutUsContent: aboutUsContent.orEmpty(),
      termsContent: termsContent.orEmpty(),
      privacyContent: privacyContent.orEmpty(),
      copyrightContent: copyrightContent.orEmpty(),
      deleteAccountContent: deleteAccountContent.orEmpty(),
      plansSubscriptionsTermsContent: plansSubscriptionsTermsContent.orEmpty(),
      paymentTermsContent: paymentTermsContent.orEmpty(),
      aboutUsContentText: aboutUsContentText.orEmpty(),
      termsContentText: termsContentText.orEmpty(),
      privacyContentText: privacyContentText.orEmpty(),
      copyrightContentText: copyrightContentText.orEmpty(),
      deleteAccountContentText: deleteAccountContentText.orEmpty(),
      plansSubscriptionsTermsContentText:
          plansSubscriptionsTermsContentText.orEmpty(),
      paymentTermsContentText: paymentTermsContentText.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [
        aboutUsContent,
        termsContent,
        privacyContent,
        copyrightContent,
        deleteAccountContent,
        plansSubscriptionsTermsContent,
        paymentTermsContent,
        aboutUsContentText,
        termsContentText,
        privacyContentText,
        copyrightContentText,
        deleteAccountContentText,
        plansSubscriptionsTermsContentText,
        paymentTermsContentText,
      ];

  factory SettingsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingsDataResponseFromJson(json['pages']);
}
