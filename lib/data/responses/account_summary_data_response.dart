part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class AccountSummaryDataResponse extends Equatable
    implements DataResponse<AccountSummaryData> {
  final int? total;
  final List<AccountSummaryResponse>? accountSummary;
  final int? balance;

  const AccountSummaryDataResponse({
    required this.total,
    required this.accountSummary,
    required this.balance,
  });

  @override
  AccountSummaryData toDomain() {
    return AccountSummaryData(
      total: total.orZero(),
      accountSummary: accountSummary?.map((e) => e.toDomain()).toList() ?? [],
      balance: balance.orZero(),
    );
  }

  @override
  List<Object?> get props => [
        total,
        accountSummary,
        balance,
      ];

  factory AccountSummaryDataResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryDataResponseFromJson(json);
}
