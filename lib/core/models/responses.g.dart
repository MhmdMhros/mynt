// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoDataResponse _$NoDataResponseFromJson(Map<String, dynamic> json) =>
    NoDataResponse();

SignupSuccessResponse _$SignupSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    SignupSuccessResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

OtpVerificationSuccessResponse _$OtpVerificationSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    OtpVerificationSuccessResponse(
      message: json['message'] as String?,
    );

ResendEmailVerificationSuccessResponse
    _$ResendEmailVerificationSuccessResponseFromJson(
            Map<String, dynamic> json) =>
        ResendEmailVerificationSuccessResponse(
          success: json['success'] as bool?,
          message: json['message'] as String?,
        );

LoginSuccessResponse _$LoginSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    LoginSuccessResponse(
      userId: json['id'] as int?,
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      expiresIn: json['expires_in'] as int?,
    );

SendOtpResponse _$SendOtpResponseFromJson(Map<String, dynamic> json) =>
    SendOtpResponse(
      token: json['token'] as int?,
    );

ForgetPasswordSuccessResponse _$ForgetPasswordSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    ForgetPasswordSuccessResponse(
      message: json['message'] as String?,
    );

VerifyResetPasswordOtpSuccessResponse
    _$VerifyResetPasswordOtpSuccessResponseFromJson(
            Map<String, dynamic> json) =>
        VerifyResetPasswordOtpSuccessResponse(
          message: json['message'] as String?,
          otp: json['otp'] as String?,
        );

ResetPasswordSuccessResponse _$ResetPasswordSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    ResetPasswordSuccessResponse(
      message: json['message'] as String?,
    );

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: json['gender'] as int?,
      birthDate: json['birthdate'] as String?,
      locale: json['locale'] as String?,
      commissionValue: json['commission_value'] as String?,
      commissionType: json['commission_type'] as int?,
      statusId: json['status_id'] as int?,
      statusText: json['status_text'] as String?,
      statusSlug: json['status_slug'] as String?,
      balance: json['balance'] as int?,
      provider: json['provider'] == null
          ? null
          : UserResponse.fromJson(json['provider'] as Map<String, dynamic>),
    );

ChangePasswordSuccessResponse _$ChangePasswordSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordSuccessResponse(
      message: json['message'] as String?,
    );

SignedUrlResponse _$SignedUrlResponseFromJson(Map<String, dynamic> json) =>
    SignedUrlResponse(
      video: json['video'] == null
          ? null
          : SignedUrlDataResponse.fromJson(
              json['video'] as Map<String, dynamic>),
      thumbnail: json['thumbnail'] == null
          ? null
          : SignedUrlDataResponse.fromJson(
              json['thumbnail'] as Map<String, dynamic>),
    );

SignedUrlDataResponse _$SignedUrlDataResponseFromJson(
        Map<String, dynamic> json) =>
    SignedUrlDataResponse(
      id: json['id'] as String?,
      signature: json['signature'] as String?,
    );

BodyPhotosDataResponse _$BodyPhotosDataResponseFromJson(
        Map<String, dynamic> json) =>
    BodyPhotosDataResponse(
      bodyPhotos: (json['bodyPhotos'] as List<dynamic>?)
          ?.map((e) => BodyPhotoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

BodyPhotoResponse _$BodyPhotoResponseFromJson(Map<String, dynamic> json) =>
    BodyPhotoResponse(
      id: json['id'] as String?,
      photoUrl: json['photoUrl'] as String?,
      type: json['type'] as String?,
      createdAt: json['createdAt'] as String?,
    );

RefreshTokenSuccessResponse _$RefreshTokenSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    RefreshTokenSuccessResponse(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      expiresIn: json['expires_in'] as int?,
    );

SettingsDataResponse _$SettingsDataResponseFromJson(
  Map<String, dynamic> json,
) =>
    SettingsDataResponse(
      aboutUsContent: json['about_us_content'] as String?,
      termsContent: json['terms_content'] as String?,
      privacyContent: json['privacy_content'] as String?,
      copyrightContent: json['copyright_content'] as String?,
      deleteAccountContent: json['delete_account_content'] as String?,
      plansSubscriptionsTermsContent:
          json['plans_subscriptions_terms_content'] as String?,
      paymentTermsContent: json['payment_terms_content'] as String?,
      aboutUsContentText: json['about_us_content_text'] as String?,
      termsContentText: json['terms_content_text'] as String?,
      privacyContentText: json['privacy_content_text'] as String?,
      copyrightContentText: json['copyright_content_text'] as String?,
      deleteAccountContentText: json['delete_account_content_text'] as String?,
      plansSubscriptionsTermsContentText:
          json['plans_subscriptions_terms_content_text'] as String?,
      paymentTermsContentText: json['payment_terms_content_text'] as String?,
    );

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

ArticleResponse _$ArticleResponseFromJson(Map<String, dynamic> json) =>
    ArticleResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      excerpt: json['excerpt'] as String?,
      metaTitle: json['meta_title'] as String?,
      metaDescription: json['meta_description'] as String?,
      publishedAt: json['published_at'] as String?,
      route: json['route'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String?,
    );

BookedDateResponse _$BookedDateResponseFromJson(Map<String, dynamic> json) =>
    BookedDateResponse(
      bookingId: json['booking_id'] as int?,
      date: json['date'] as String?,
    );

BookingResponse _$BookingResponseFromJson(Map<String, dynamic> json) =>
    BookingResponse(
      id: json['id'] as int?,
      propertyNumber: json['property_number'] as String?,
      checkin: json['checkin'] as String?,
      checkout: json['checkout'] as String?,
      bookingId: json['booking_id'] as int?,
      accountId: json['account_id'] as int?,
      netTotal: json['net_total'] as String?,
      balance: json['balance'] as String?,
      customerName: json['customer_name'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      projectId: json['project_id'] as int?,
      projectTitle: json['project_title'] as String?,
      projectAddress: json['project_address'] as String?,
      gallery:
          (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList(),
      bookedDates: (json['booked_dates'] as List<dynamic>?)
          ?.map((e) => BookedDateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TicketResponse _$TicketResponseFromJson(Map<String, dynamic> json) =>
    TicketResponse(
      id: json['id'] as int?,
      propertyTitle: json['property_title'] as String?,
      propertyNumber: json['property_number'] as String?,
      propertyBuilding: json['property_building'] as String?,
      customerName: json['customer_name'] as String?,
      customerPhone: json['customer_phone'] as String?,
      ownerName: json['owner_name'] as String?,
      ownerPhone: json['owner_phone'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      statusText: json['status_text'] as String?,
      creationDate: json['creation_date'] as String?,
      creationTime: json['creation_time'] as String?,
      gallery:
          (json['gallery'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) =>
    BannerResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      featuredImage: json['featured_image'] as String?,
    );

DashboardDataResponse _$DashboardDataResponseFromJson(
        Map<String, dynamic> json) =>
    DashboardDataResponse(
        banners: (json['banners'] as List<dynamic>?)
            ?.map((e) => BannerResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
        bookings: (json['bookings'] as List<dynamic>?)
            ?.map((e) => BookingResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
        tickets: (json['tickets'] as List<dynamic>?)
            ?.map((e) => TicketResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => ArticleResponse.fromJson(e as Map<String, dynamic>))
            .toList(),
        balance: json['balance'] as String?,
        unReadNotificationCount: json['unReadNotificationCount'] as int?);

NotificationResponse _$NotificationResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationResponse(
      id: json['id'] as int?,
      notiObjectId: json['noti_object_id'] as int?,
      entityId: json['entity_id'] as int?,
      entityTypeId: json['entity_type_id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String?,
      encodedUrl: json['encoded_url'] as String?,
      time: json['time'] as String?,
      readAt: json['read_at'] as String?,
    );

NotificationsDataResponse _$NotificationsDataResponseFromJson(
        Map<String, dynamic> json) =>
    NotificationsDataResponse(
      total: json['total'] as int?,
      notifications: (json['items'] as List<dynamic>?)
          ?.map((e) => NotificationResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalUnReadCount: json['totalUnReadCount'] as int?,
    );

BookingsDataResponse _$BookingsDataResponseFromJson(
        Map<String, dynamic> json) =>
    BookingsDataResponse(
      total: json['total'] as int?,
      bookings: (json['items'] as List<dynamic>?)
          ?.map((e) => BookingResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TicketsDataResponse _$TicketsDataResponseFromJson(Map<String, dynamic> json) =>
    TicketsDataResponse(
      total: json['total'] as int?,
      tickets: (json['items'] as List<dynamic>?)
          ?.map((e) => TicketResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

RestrictionSuccessResponse _$RestrictionSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    RestrictionSuccessResponse(
      message: json['message'] as String?,
    );

AccountSummaryResponse _$AccountSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    AccountSummaryResponse(
      id: json['id'] as int?,
      propertyNumber: json['property_number'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      debit: json['debit'] as String?,
      credit: json['credit'] as String?,
      balance: json['balance'] as String?,
      createdDate: json['created_date'] as String?,
      createdAt: json['created_at'] as String?,
    );

AccountSummaryDataResponse _$AccountSummaryDataResponseFromJson(
        Map<String, dynamic> json) =>
    AccountSummaryDataResponse(
      total: json['total'] as int?,
      accountSummary: (json['items'] as List<dynamic>?)
          ?.map(
              (e) => AccountSummaryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      balance: json['balance'] as String?,
    );

UnReadNotificationsCountResponse _$UnReadNotificationsCountResponseFromJson(
        int value) =>
    UnReadNotificationsCountResponse(
      unReadCount: value,
    );

ReviewSuccessResponse _$ReviewSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    ReviewSuccessResponse(
      message: json['message'] as String?,
    );

CreateTicketSuccessResponse _$CreateTicketSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    CreateTicketSuccessResponse(
      message: json['message'] as String?,
    );

ServiceTitleResponse _$ServiceTitleResponseFromJson(
        Map<String, dynamic> json) =>
    ServiceTitleResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

BookingIdResponse _$BookingIdResponseFromJson(Map<String, dynamic> json) =>
    BookingIdResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
    );

RequestServiceDataResponse _$RequestServiceDataResponseFromJson(
        Map<String, dynamic> json) =>
    RequestServiceDataResponse(
      serviceTitles: (json['complaint_titles'] as List<dynamic>?)
          ?.map((e) => ServiceTitleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookingIds: (json['properties'] as List<dynamic>?)
          ?.map((e) => BookingIdResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

UploadedImageDataResponse _$UploadedImageDataResponseFromJson(
        Map<String, dynamic> json) =>
    UploadedImageDataResponse(
      id: json['id'] as int?,
      fileName: json['file_name'] as String?,
      dir: json['dir'] as String?,
      mimeType: json['mime_type'] as String?,
      url: json['url'] as String?,
      uploadPath: json['upload_path'] as String?,
      background: json['background'] as String?,
      field: json['field'] as String?,
    );

ImagesDataResponse _$ImagesDataResponseFromJson(Map<String, dynamic> json) =>
    ImagesDataResponse(
      uploaded: (json['uploaded'] as List<dynamic>?)
          ?.map((e) =>
              UploadedImageDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

DownloadPdfSuccessResponse _$DownloadPdfSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    DownloadPdfSuccessResponse(
      url: json['url'] as String?,
    );

DownloadExcelSuccessResponse _$DownloadExcelSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    DownloadExcelSuccessResponse(
      url: json['url'] as String?,
    );
