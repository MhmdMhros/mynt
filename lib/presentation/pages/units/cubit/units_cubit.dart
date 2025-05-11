// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'units_state.dart';

@injectable
class UnitsCubit extends Cubit<UnitsState> {
  UnitsCubit() : super(UnitsInitial());

  static UnitsCubit get(BuildContext context) => BlocProvider.of(context);
}
