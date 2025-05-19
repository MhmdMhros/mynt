part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class DashboardDataResponse extends Equatable
    implements DataResponse<DashboardData> {
  final List<BannerResponse>? banners;
  final List<BookingResponse>? bookings;
  final List<TicketResponse>? tickets;
  final List<ArticleResponse>? articles;
  final String? balance;

  const DashboardDataResponse({
    required this.banners,
    required this.bookings,
    required this.tickets,
    required this.articles,
    required this.balance,
  });

  @override
  DashboardData toDomain() {
    return DashboardData(
      banners: banners?.map((e) => e.toDomain()).toList() ?? [],
      bookings: bookings?.map((e) => e.toDomain()).toList() ?? [],
      tickets: tickets?.map((e) => e.toDomain()).toList() ?? [],
      articles: articles?.map((e) => e.toDomain()).toList() ?? [],
      balance: balance.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [
        banners,
        bookings,
        tickets,
        articles,
        balance,
      ];

  factory DashboardDataResponse.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataResponseFromJson(json);
}
