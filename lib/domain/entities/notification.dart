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

  Notification_R copyWith({
    int? id,
    int? notiObjectId,
    int? entityId,
    int? entityTypeId,
    String? title,
    String? description,
    String? url,
    String? encodedUrl,
    String? time,
    String? readAt,
  }) {
    return Notification_R(
      id: id ?? this.id,
      notiObjectId: notiObjectId ?? this.notiObjectId,
      entityId: entityId ?? this.entityId,
      entityTypeId: entityTypeId ?? this.entityTypeId,
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      encodedUrl: encodedUrl ?? this.encodedUrl,
      time: time ?? this.time,
      readAt: readAt ?? this.readAt,
    );
  }
}
