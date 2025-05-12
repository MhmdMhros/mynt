part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class NotificationResponse extends Equatable
    implements DataResponse<Notification_R> {
  final int? id;
  @JsonKey(name: 'noti_object_id')
  final int? notiObjectId;
  @JsonKey(name: 'entity_id')
  final int? entityId;
  @JsonKey(name: 'entity_type_id')
  final int? entityTypeId;
  final String? title;
  final String? description;
  final String? url;
  @JsonKey(name: 'encoded_url')
  final String? encodedUrl;
  final String? time;
  @JsonKey(name: 'read_at')
  final String? readAt;

  const NotificationResponse({
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

  @override
  Notification_R toDomain() {
    return Notification_R(
      id: id.orZero(),
      notiObjectId: notiObjectId.orZero(),
      entityId: entityId.orZero(),
      entityTypeId: entityTypeId.orZero(),
      title: title.orEmpty(),
      description: description.orEmpty(),
      url: url.orEmpty(),
      encodedUrl: encodedUrl.orEmpty(),
      time: time.orEmpty(),
      readAt: readAt.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        notiObjectId,
        entityId,
        entityTypeId,
        title,
        description,
        url,
        encodedUrl,
        time,
        readAt,
      ];

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);
}
