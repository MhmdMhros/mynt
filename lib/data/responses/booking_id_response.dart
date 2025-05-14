part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class BookingIdResponse extends Equatable implements DataResponse<BookingId> {
  final int? id;
  final String? title;

  const BookingIdResponse({
    required this.id,
    required this.title,
  });

  @override
  BookingId toDomain() {
    return BookingId(
      id: id.orZero(),
      title: title.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
      ];

  factory BookingIdResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingIdResponseFromJson(json);
}
