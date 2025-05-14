part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class UnReadNotificationsCountResponse extends Equatable
    implements DataResponse<UnReadNotificationsCount> {
  @JsonKey(name: 'totalUnReadCount')
  final int? unReadCount;

  const UnReadNotificationsCountResponse({
    required this.unReadCount,
  });

  @override
  UnReadNotificationsCount toDomain() {
    return UnReadNotificationsCount(
      unReadCount: unReadCount.orZero(),
    );
  }

  @override
  List<Object?> get props => [unReadCount];

  factory UnReadNotificationsCountResponse.fromJson(Map<String, dynamic> json) {
    return _$UnReadNotificationsCountResponseFromJson(
        json['totalUnReadCount'] as int);
  }
}
