part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class RestrictionSuccessResponse extends Equatable
    implements DataResponse<RestrictionSuccess> {
  final String? message;

  const RestrictionSuccessResponse({
    required this.message,
  });

  @override
  RestrictionSuccess toDomain() {
    return RestrictionSuccess(message: message.orEmpty());
  }

  @override
  List<Object?> get props => [message];

  factory RestrictionSuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$RestrictionSuccessResponseFromJson(json);
  }
}
