// balances_state.dart
part of 'balances_cubit.dart';

abstract class BalancesState extends Equatable {
  const BalancesState();

  @override
  List<Object?> get props => [];
}

class BalancesInitial extends BalancesState {}

class BalancesLoaded extends BalancesState {
  final String selectedUnit;
  final List<AccountSummary> filteredList;
  final List<String> unitNumbers;

  const BalancesLoaded({
    required this.selectedUnit,
    required this.filteredList,
    required this.unitNumbers,
  });

  @override
  List<Object?> get props => [selectedUnit, filteredList, unitNumbers];
}
