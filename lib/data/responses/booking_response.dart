part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class BookingResponse extends Equatable implements DataResponse<Booking> {
  final int? id;
  @JsonKey(name: 'property_number')
  final String? propertyNumber;
  final String? checkin;
  final String? checkout;
  @JsonKey(name: 'booking_id')
  final int? bookingId;
  @JsonKey(name: 'account_id')
  final int? accountId;
  @JsonKey(name: 'net_total')
  final String? netTotal;
  final String? balance;
  @JsonKey(name: 'customer_name')
  final String? customerName;
  final String? title;
  final String? description;
  @JsonKey(name: 'project_id')
  final int? projectId;
  @JsonKey(name: 'project_title')
  final String? projectTitle;
  @JsonKey(name: 'project_address')
  final String? projectAddress;
  final List<GalleryResponse>? gallery;
  @JsonKey(name: 'booked_dates')
  final List<BookedDateResponse>? bookedDates;

  const BookingResponse({
    required this.id,
    required this.propertyNumber,
    required this.checkin,
    required this.checkout,
    required this.bookingId,
    required this.accountId,
    required this.netTotal,
    required this.balance,
    required this.customerName,
    required this.title,
    required this.description,
    required this.projectId,
    required this.projectTitle,
    required this.projectAddress,
    required this.gallery,
    required this.bookedDates,
  });

  @override
  Booking toDomain() {
    return Booking(
      id: id.orZero(),
      propertyNumber: propertyNumber.orEmpty(),
      checkin: checkin.orEmpty(),
      checkout: checkout.orEmpty(),
      bookingId: bookingId.orZero(),
      accountId: accountId.orZero(),
      netTotal: netTotal.orEmpty(),
      balance: balance.orEmpty(),
      customerName: customerName.orEmpty(),
      title: title.orEmpty(),
      description: description.orEmpty(),
      projectId: projectId.orZero(),
      projectTitle: projectTitle.orEmpty(),
      projectAddress: projectAddress.orEmpty(),
      gallery: gallery?.map((e) => e.toDomain()).toList() ?? [],
      bookedDates: bookedDates?.map((e) => e.toDomain()).toList() ?? [],
    );
  }

  @override
  List<Object?> get props => [
        id,
        propertyNumber,
        checkin,
        checkout,
        bookingId,
        accountId,
        netTotal,
        balance,
        customerName,
        title,
        description,
        projectId,
        projectTitle,
        projectAddress,
        gallery,
        bookedDates,
      ];

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class BookedDateResponse extends Equatable
    implements DataResponse<BookedDateModel> {
  @JsonKey(name: 'booking_id')
  final int? bookingId;
  final String? date;

  const BookedDateResponse({
    required this.bookingId,
    required this.date,
  });

  @override
  BookedDateModel toDomain() {
    return BookedDateModel(
      bookingId: bookingId.orZero(),
      date: date.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [bookingId, date];

  factory BookedDateResponse.fromJson(Map<String, dynamic> json) =>
      _$BookedDateResponseFromJson(json);
}

@JsonSerializable(createToJson: false)
class GalleryResponse extends Equatable implements DataResponse<GalleryModel> {
  final String? s;
  final String? m;

  const GalleryResponse({
    required this.s,
    required this.m,
  });

  @override
  GalleryModel toDomain() {
    return GalleryModel(
      s: s.orEmpty(),
      m: m.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [s, m];

  factory GalleryResponse.fromJson(Map<String, dynamic> json) =>
      _$GalleryResponseFromJson(json);
}
