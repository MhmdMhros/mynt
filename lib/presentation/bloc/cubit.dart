import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynt/presentation/bloc/state.dart';
import 'package:mynt/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:mynt/presentation/pages/more/more_screen.dart';
import 'package:mynt/presentation/pages/tickets/tickets_screen.dart';
import 'package:mynt/presentation/pages/units/all_units_screen.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(MainInitialState());
  static MainCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const DashBoardScreen(),
    const AllUnitsScreen(),
    const TicketsScreen(),
    const MoreScreen()
  ];
  changeBottomBar(int index) {
    currentIndex = index;
    emit(MainBottomTopBarState());
  }
}
