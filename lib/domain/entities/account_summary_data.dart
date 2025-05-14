import 'package:mynt/domain/entities/account_summary.dart';

class AccountSummaryData {
  final int total;
  final List<AccountSummary> accountSummary;
  final int balance;

  AccountSummaryData({
    required this.total,
    required this.accountSummary,
    required this.balance,
  });
}
