part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class NotificationsDataResponse extends Equatable
    implements DataResponse<NotificationsData> {
  final int? total;
  final int? totalUnReadCount;
  final List<NotificationResponse>? notifications;

  const NotificationsDataResponse({
    required this.total,
    required this.totalUnReadCount,
    required this.notifications,
  });

  @override
  NotificationsData toDomain() {
    return NotificationsData(
      total: total.orZero(),
      totalUnReadCount: totalUnReadCount.orZero(),
      notifications: notifications?.map((e) => e.toDomain()).toList() ?? [],
    );
  }

  @override
  List<Object?> get props => [
        total,
        totalUnReadCount,
        notifications,
      ];

  factory NotificationsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationsDataResponseFromJson(json);
}
