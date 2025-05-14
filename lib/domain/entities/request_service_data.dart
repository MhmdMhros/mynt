import 'package:mynt/domain/entities/booking_id.dart';
import 'package:mynt/domain/entities/service_title.dart';

class RequestServiceData {
  final List<ServiceTitle>? serviceTitles;
  final List<BookingId>? bookingIds;

  const RequestServiceData({
    required this.serviceTitles,
    required this.bookingIds,
  });
}
