part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class RequestServiceDataResponse extends Equatable
    implements DataResponse<RequestServiceData> {
  final List<ServiceTitleResponse>? serviceTitles;
  final List<BookingIdResponse>? bookingIds;

  const RequestServiceDataResponse({
    required this.serviceTitles,
    required this.bookingIds,
  });

  @override
  RequestServiceData toDomain() {
    return RequestServiceData(
      serviceTitles: serviceTitles?.map((e) => e.toDomain()).toList() ?? [],
      bookingIds: bookingIds?.map((e) => e.toDomain()).toList() ?? [],
    );
  }

  @override
  List<Object?> get props => [
        serviceTitles,
        bookingIds,
      ];

  factory RequestServiceDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RequestServiceDataResponseFromJson(json);
}
