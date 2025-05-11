import 'package:mynt/domain/entities/article.dart';
import 'package:mynt/domain/entities/banner.dart';
import 'package:mynt/domain/entities/booking.dart';
import 'package:mynt/domain/entities/ticket.dart';

class DashboardData {
  final List<Banner_R>? banners;
  final List<Booking>? bookings;
  final List<Ticket>? tickets;
  final List<Article>? articles;
  final int? balance;

  const DashboardData({
    required this.banners,
    required this.bookings,
    required this.tickets,
    required this.articles,
    required this.balance,
  });
}
