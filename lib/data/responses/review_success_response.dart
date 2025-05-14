part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class ReviewSuccessResponse extends Equatable
    implements DataResponse<ReviewSuccess> {
  final String? message;

  const ReviewSuccessResponse({
    required this.message,
  });

  @override
  ReviewSuccess toDomain() {
    return ReviewSuccess(message: message.orEmpty());
  }

  @override
  List<Object?> get props => [message];

  factory ReviewSuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$ReviewSuccessResponseFromJson(json);
  }
}
