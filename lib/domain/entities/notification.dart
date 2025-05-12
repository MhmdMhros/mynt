// ignore_for_file: camel_case_types

class Notification_R {
  final int? id;
  final int? notiObjectId;
  final int? entityId;
  final int? entityTypeId;
  final String? title;
  final String? description;
  final String? url;
  final String? encodedUrl;
  final String? time;
  final String? readAt;

  Notification_R({
    required this.id,
    required this.notiObjectId,
    required this.entityId,
    required this.entityTypeId,
    required this.title,
    required this.description,
    required this.url,
    required this.encodedUrl,
    required this.time,
    required this.readAt,
  });
}
