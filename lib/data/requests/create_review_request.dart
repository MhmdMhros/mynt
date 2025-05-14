part of 'requests.dart';

@JsonSerializable(createFactory: false)
class CreateReviewRequest {
  final String ticketId;
  final String comment;
  final String score;

  CreateReviewRequest({
    required this.ticketId,
    required this.comment,
    required this.score,
  });

  Map<String, dynamic> toJson() => _$CreateReviewRequestToJson(this);
}
