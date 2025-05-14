import 'package:mynt/domain/entities/send_otp.dart';

import '../../domain/entities/body_photo.dart';
import '../../domain/entities/body_photos_data.dart';
import '../../domain/entities/signed_url_data.dart';
import '../../domain/entities/signed_url.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/change_password_success.dart';
import '../../domain/entities/reset_password_success.dart';
import '../../domain/entities/verify_reset_password_otp_success.dart';
import '../../domain/entities/forget_password_success.dart';
import '../../domain/entities/login_success.dart';
import '../../domain/entities/resend_email_verification_success.dart';
import '../../domain/entities/otp_verification_success.dart';
import '../../domain/entities/signup_success.dart';
import '../../domain/entities/refresh_token_success.dart';
import '../../domain/entities/settings_data.dart';
import '../../domain/entities/dashboard_data.dart';
import '../../domain/entities/banner.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/ticket.dart';
import '../../domain/entities/article.dart';
import '../../domain/entities/notification.dart';
import '../../domain/entities/notifications_data.dart';
import '../../domain/entities/bookings_data.dart';
import '../../domain/entities/tickets_data.dart';
import '../../domain/entities/restriction_success.dart';
import '../../domain/entities/account_summary.dart';
import '../../domain/entities/account_summary_data.dart';
import '../../domain/entities/un_read_notifications_count.dart';
import '../../domain/entities/review_success.dart';
import '../../domain/entities/create_ticket_success.dart';
import '../../domain/entities/service_title.dart';
import '../../domain/entities/booking_id.dart';
import '../../domain/entities/request_service_data.dart';
import '../../domain/entities/uploaded_image_data.dart';
import '../../domain/entities/images_data.dart';

// ignore: unused_import
import '../../app/extensions.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

import 'no_data.dart';

part 'responses.g.dart';

part '../../data/responses/signup_success_response.dart';

part '../../data/responses/otp_verification_success_response.dart';

part '../../data/responses/resend_email_verification_success_response.dart';

part '../../data/responses/login_success_response.dart';

part '../../data/responses/send_otp_response.dart';

part '../../data/responses/forget_password_success_response.dart';

part '../../data/responses/verify_reset_password_otp_success_response.dart';

part '../../data/responses/reset_password_success_response.dart';

part '../../data/responses/user_response.dart';

part '../../data/responses/change_password_success_response.dart';

part '../../data/responses/signed_url_response.dart';

part '../../data/responses/signed_url__data_response.dart';

part '../../data/responses/body_photos_data_response.dart';

part '../../data/responses/body_photo_response.dart';

part '../../data/responses/refresh_token_success_response.dart';

part '../../data/responses/settings_data_response.dart';

part '../../data/responses/dashboard_data_response.dart';

part '../../data/responses/article_response.dart';

part '../../data/responses/banner_response.dart';

part '../../data/responses/booking_response.dart';

part '../../data/responses/ticket_response.dart';

part '../../data/responses/notification_response.dart';

part '../../data/responses/notifications_data_response.dart';

part '../../data/responses/bookings_data_response.dart';

part '../../data/responses/tickets_data_response.dart';

part '../../data/responses/restriction_success_response.dart';

part '../../data/responses/account_summary_response.dart';

part '../../data/responses/account_summary_data_response.dart';

part '../../data/responses/un_read_count_notifications_response.dart';

part '../../data/responses/review_success_response.dart';

part '../../data/responses/create_ticket_success_response.dart';

part '../../data/responses/service_title_response.dart';

part '../../data/responses/booking_id_response.dart';

part '../../data/responses/request_service_data_response.dart';

part '../../data/responses/uploaded_image_data_response.dart';

part '../../data/responses/images_data_response.dart';

abstract class DataResponse<T> {
  T toDomain();
}

@JsonSerializable(createToJson: false)
final class NoDataResponse implements DataResponse<NoData> {
  const NoDataResponse();

  @override
  NoData toDomain() => const NoData();

  factory NoDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NoDataResponseFromJson(json);
}
