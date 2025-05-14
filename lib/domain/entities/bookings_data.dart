import 'package:mynt/domain/entities/booking.dart';

class BookingsData {
  final int total;
  final List<Booking> bookings;

  BookingsData({
    required this.total,
    required this.bookings,
  });
}
