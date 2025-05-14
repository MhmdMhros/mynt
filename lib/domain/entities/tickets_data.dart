import 'package:mynt/domain/entities/ticket.dart';

class TicketsData {
  final int total;
  final List<Ticket> tickets;

  TicketsData({
    required this.total,
    required this.tickets,
  });
}
