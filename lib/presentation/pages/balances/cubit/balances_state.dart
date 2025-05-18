part of 'balances_cubit.dart';

abstract class BalancesState extends Equatable {
  const BalancesState();

  @override
  List<Object?> get props => [];
}

class BalancesInitial extends BalancesState {}

class BalancesLoaded extends BalancesState {}

class DownloadAllAccountSummaryPdfLoading extends BalancesState {}

class DownloadAllAccountSummaryPdfSuccess extends BalancesState {}

class DownloadAllAccountSummaryPdfFailure extends BalancesState {
  final String error;
  const DownloadAllAccountSummaryPdfFailure(this.error);
}

class DownloadAllAccountSummaryExcelLoading extends BalancesState {}

class DownloadAllAccountSummaryExcelSuccess extends BalancesState {}

class DownloadAllAccountSummaryExcelFailure extends BalancesState {
  final String error;
  const DownloadAllAccountSummaryExcelFailure(this.error);
}

class DownloadbookingAccountSummaryPdfLoading extends BalancesState {}

class DownloadbookingAccountSummaryPdfSuccess extends BalancesState {}

class DownloadbookingAccountSummaryPdfFailure extends BalancesState {
  final String error;
  const DownloadbookingAccountSummaryPdfFailure(this.error);
}

class DownloadbookingAccountSummaryExcelLoading extends BalancesState {}

class DownloadbookingAccountSummaryExcelSuccess extends BalancesState {}

class DownloadbookingAccountSummaryExcelFailure extends BalancesState {
  final String error;
  const DownloadbookingAccountSummaryExcelFailure(this.error);
}
