// ignore_for_file: unnecessary_brace_in_string_interps

class Constants {
  Constants._();

  static const String appName = 'mynt';
  static String baseUrl = 'http://apis.mynt.kixedo.com/';
  static const Duration apiTimeOut = Duration(seconds: 120);
  static const Duration snackBarDuration = Duration(seconds: 2);
  static const Duration bottomNavDuration = Duration(milliseconds: 600);

  static const List<String> englishDaysOfWeek = [
    "Sat",
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
  ];
  static const List<String> arabicDaysOfWeek = [
    "السبت",
    "الأحد",
    "الاثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
    "الجمعة",
  ];
  static const String signupPath = 'auth/register/';

  static const String verifyAccountPath = 'auth/verify-account';
  static const String resendAccountVerificationOtpPath =
      'auth/send-account-verification';

  static const String loginPath = 'owner/login';
  static const String checkAccountPath = 'owner/account/exists';
  static const String sendOtpPath = 'otp/request';
  static const String otpVerificationPath = 'otp/validate';
  static const String resetPasswordPath = 'owner/password/reset';
  static const String deleteAccountPath = 'user/delete-account';
  static const String refreshTokenPath = 'owner/token/refresh';

  static const String logoutPath = 'owner/logout';
  static const String forgetPasswordPath = 'auth/forget-password';
  static const String verifyResetPasswordOtpPath = 'auth/verify-reset-password';
  static const String editAccountPath = 'owner/account/edit';
  static const String settingsPath = 'settings-management?slug=pages';

  static const String getUserPath = 'owner/data';
  static const String getHomeDataPath = 'owner/home-page';
  static const String getNotificationsPath = 'notifications';
  static const String getBookingsPath = 'property-management';
  static const String getTicketsPath = 'complaints';
  static const String getBookingDetailsPath = 'property-management/';
  static const String createRestrictionPath =
      'property-management/restrictions';
  static const String getAccountSummary = 'account-summary';
  static const String readNotification = 'notifications/{notificationId}/read';
  static const String createReviewPath = 'reviews';
  static const String createTicketPath = 'complaints';
  static const String getRequestServiceDataPath = 'complaints/create';
  static const String uploadTicketImagesPath = 'complaints/upload';
  static const String uploadTicketImagesPath = 'complaints/upload';
  static const String uploadTicketImagesPath = 'complaints/upload';

  static const String updateUserPath = 'users/{userId}';
  static const String getAllClientBodyPhotosPath =
      'clients/{clientId}/body-photos';
}
