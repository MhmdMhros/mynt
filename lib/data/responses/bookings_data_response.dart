part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class BookingsDataResponse extends Equatable
    implements DataResponse<BookingsData> {
  final int? total;
  final List<BookingResponse>? bookings;

  const BookingsDataResponse({
    required this.total,
    required this.bookings,
  });

  @override
  BookingsData toDomain() {
    return BookingsData(
      total: total.orZero(),
      bookings: bookings?.map((e) => e.toDomain()).toList() ?? [],
    );
  }

  @override
  List<Object?> get props => [
        total,
        bookings,
      ];

  factory BookingsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingsDataResponseFromJson(json);
}
