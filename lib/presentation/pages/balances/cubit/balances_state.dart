part of 'balances_cubit.dart';

sealed class BalancesState extends Equatable {
  const BalancesState();

  @override
  List<Object> get props => [];
}

final class BalancesInitial extends BalancesState {}
