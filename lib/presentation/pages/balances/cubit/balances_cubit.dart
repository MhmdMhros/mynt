// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/account_summary.dart';
import 'package:mynt/domain/entities/account_summary_data.dart';

part 'balances_state.dart';

@injectable
class BalancesCubit extends Cubit<BalancesState> {
  BalancesCubit() : super(BalancesInitial());

  static BalancesCubit get(BuildContext context) => BlocProvider.of(context);
  void loadData(AccountSummaryData data) {
    final allUnits = data.accountSummary
        .map((e) => e.propertyNumber ?? '')
        .toSet()
        .where((e) => e.isNotEmpty)
        .toList()
      ..sort();
    allUnits.insert(0, 'All');

    emit(BalancesLoaded(
      selectedUnit: 'All',
      filteredList: data.accountSummary,
      unitNumbers: allUnits,
    ));
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

    emit(BalancesLoaded(
      selectedUnit: unit,
      filteredList: filtered,
      unitNumbers: allUnits,
    ));
  }
}
