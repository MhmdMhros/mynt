// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/base_usecase.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/account_summary.dart';
import 'package:mynt/domain/entities/account_summary_data.dart';
import 'package:mynt/domain/usecases/download_excel_all_account_summary_usecase.dart';
import 'package:mynt/domain/usecases/download_excel_booking_account_summary_usecase.dart';
import 'package:mynt/domain/usecases/download_pdf_all_account_summary_usecase.dart';
import 'package:mynt/domain/usecases/download_pdf_booking_account_summary_usecase.dart';

part 'balances_state.dart';

@injectable
class BalancesCubit extends Cubit<BalancesState> {
  BalancesCubit(
      this._downloadPdfAllAccountSummaryUsecase,
      this._downloadExcelAllAccountSummaryUsecase,
      this._downloadPdfBookingAccountSummaryUsecase,
      this._downloadExcelBookingAccountSummaryUsecase)
      : super(BalancesInitial());
  final DownloadPdfAllAccountSummaryUsecase
      _downloadPdfAllAccountSummaryUsecase;
  final DownloadExcelAllAccountSummaryUsecase
      _downloadExcelAllAccountSummaryUsecase;
  final DownloadPdfBookingAccountSummaryUsecase
      _downloadPdfBookingAccountSummaryUsecase;
  final DownloadExcelBookingAccountSummaryUsecase
      _downloadExcelBookingAccountSummaryUsecase;

  static BalancesCubit get(BuildContext context) => BlocProvider.of(context);

  String selectedUnit = '';
  List<String> unitNumbers = [];
  List<AccountSummary> filteredList = [];

  void loadData(AccountSummaryData data) {
    final allUnits = data.accountSummary
        .map((e) => e.propertyNumber ?? '')
        .toSet()
        .where((e) => e.isNotEmpty)
        .toList()
      ..sort();
    allUnits.insert(0, 'All');
    selectedUnit = 'All';
    filteredList = data.accountSummary;
    unitNumbers = allUnits;

    emit(BalancesLoaded());
  }

  void filterByUnit(AccountSummaryData data, String unit) {
    final filtered = unit == 'All'
        ? data.accountSummary
        : data.accountSummary.where((e) => e.propertyNumber == unit).toList();

    final allUnits = data.accountSummary
        .map((e) => e.propertyNumber ?? '')
        .toSet()
        .where((e) => e.isNotEmpty)
        .toList()
      ..sort();
    allUnits.insert(0, 'All');
    selectedUnit = unit;
    filteredList = filtered;
    unitNumbers = allUnits;
    emit(BalancesLoaded());
  }

  Future<void> downloadAllAccountSummaryPdf() async {
    emit(DownloadAllAccountSummaryPdfLoading());
    final result = await _downloadPdfAllAccountSummaryUsecase(NoParams());
    result.fold(
      (failure) {
        emit(DownloadAllAccountSummaryPdfFailure(
            "Failed to download PDF: ${failure.message}"));
        showToast(
            "Failed to download PDF: ${failure.message}", ToastType.error);
      },
      (success) async {
        await downloadToDocuments(
          success.url,
          'account_summary.xlsx',
        );
        emit(DownloadAllAccountSummaryPdfSuccess());
      },
    );
  }

  Future<void> downloadAllAccountSummaryExcel() async {
    emit(DownloadAllAccountSummaryExcelLoading());
    final result = await _downloadExcelAllAccountSummaryUsecase(NoParams());
    result.fold(
      (failure) {
        emit(DownloadAllAccountSummaryExcelFailure(
            "Failed to download Excel: ${failure.message}"));
        showToast(
            "Failed to download Excel: ${failure.message}", ToastType.error);
      },
      (success) async {
        await downloadToDocuments(
          success.url,
          'account_summary.xlsx',
        );
        emit(DownloadAllAccountSummaryExcelSuccess());
      },
    );
  }

  Future<void> downloadbookingAccountSummaryPdf(String bookingId) async {
    emit(DownloadbookingAccountSummaryPdfLoading());
    final result = await _downloadPdfBookingAccountSummaryUsecase(
        DownloadPdfBookingAccountSummaryRequest(query: {
      'property_id': bookingId,
    }));
    result.fold(
      (failure) {
        emit(DownloadbookingAccountSummaryPdfFailure(
            "Failed to download PDF: ${failure.message}"));
        showToast(
            "Failed to download PDF: ${failure.message}", ToastType.error);
      },
      (success) async {
        await downloadToDocuments(
          success.url,
          'account_summary.xlsx',
        );
        emit(DownloadbookingAccountSummaryPdfSuccess());
      },
    );
  }

  Future<void> downloadbookingAccountSummaryExcel(String bookingId) async {
    emit(DownloadbookingAccountSummaryExcelLoading());
    final result = await _downloadExcelBookingAccountSummaryUsecase(
        DownloadExcelBookingAccountSummaryRequest(query: {
      'property_id': bookingId,
    }));
    result.fold(
      (failure) {
        emit(DownloadbookingAccountSummaryExcelFailure(
            "Failed to download Excel: ${failure.message}"));
        showToast(
            "Failed to download Excel: ${failure.message}", ToastType.error);
      },
      (success) async {
        await downloadToDocuments(
          success.url,
          'account_summary.xlsx',
        );
        emit(DownloadbookingAccountSummaryExcelSuccess());
      },
    );
  }
}
