// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'balances_state.dart';

@injectable
class BalancesCubit extends Cubit<BalancesState> {
  BalancesCubit() : super(BalancesInitial());

  static BalancesCubit get(BuildContext context) => BlocProvider.of(context);
}
