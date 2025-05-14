part of '../../core/models/responses.dart';

@JsonSerializable(createToJson: false)
class AccountSummaryResponse extends Equatable
    implements DataResponse<AccountSummary> {
  final int? id;
  @JsonKey(name: 'property_number')
  final String? propertyNumber;
  final String? description;
  final String? type;
  final String? debit;
  final String? credit;
  final String? balance;
  @JsonKey(name: 'created_date')
  final String? createdDate;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  const AccountSummaryResponse({
    required this.id,
    required this.propertyNumber,
    required this.description,
    required this.type,
    required this.debit,
    required this.credit,
    required this.balance,
    required this.createdDate,
    required this.createdAt,
  });

  @override
  AccountSummary toDomain() {
    return AccountSummary(
      id: id.orZero(),
      propertyNumber: propertyNumber.orEmpty(),
      description: description.orEmpty(),
      type: type.orEmpty(),
      debit: debit.orEmpty(),
      credit: credit.orEmpty(),
      balance: balance.orEmpty(),
      createdDate: createdDate.orEmpty(),
      createdAt: createdAt.orEmpty(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        propertyNumber,
        description,
        type,
        debit,
        credit,
        balance,
        createdDate,
        createdAt,
      ];

  factory AccountSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryResponseFromJson(json);
}
