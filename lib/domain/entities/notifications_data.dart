import 'package:mynt/domain/entities/notification.dart';

class NotificationsData {
  final int total;
  final int totalUnReadCount;
  final List<Notification_R> notifications;

  NotificationsData({
    required this.total,
    required this.totalUnReadCount,
    required this.notifications,
  });
}
