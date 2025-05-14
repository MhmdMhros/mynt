part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class TicketsDataResponse extends Equatable
    implements DataResponse<TicketsData> {
  final int? total;
  final List<TicketResponse>? tickets;

  const TicketsDataResponse({
    required this.total,
    required this.tickets,
  });

  @override
  TicketsData toDomain() {
    return TicketsData(
      total: total.orZero(),
      tickets: tickets?.map((e) => e.toDomain()).toList() ?? [],
    );
  }

  @override
  List<Object?> get props => [
        total,
        tickets,
      ];

  factory TicketsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$TicketsDataResponseFromJson(json);
}
