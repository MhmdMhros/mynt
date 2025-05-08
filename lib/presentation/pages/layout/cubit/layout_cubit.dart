// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/core/base_usecase.dart';
import 'package:mynt/domain/entities/user.dart';
import 'package:mynt/domain/usecases/get_provider_data_usecase.dart';
import 'package:mynt/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:mynt/presentation/pages/more/more_screen.dart';
import 'package:mynt/presentation/pages/tickets/tickets_screen.dart';
import 'package:mynt/presentation/pages/units/all_units_screen.dart';

part 'layout_state.dart';

@injectable
class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit(this._getProviderDataUseCase) : super(LayoutInitial());
  final GetProviderDataUseCase _getProviderDataUseCase;

  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  User? user;

  int bottomNavIndex = 0;

  void resetBottomNavIndex() => bottomNavIndex = 0;
  Widget get currentScreen => screens[bottomNavIndex];

  final List<Widget> screens = [
    const DashBoardScreen(),
    const AllUnitsScreen(),
    const TicketsScreen(),
    const MoreScreen(),
  ];

  void changeCurrentSelectedBottomNavIndex(int index, BuildContext context) {
    emit(LayoutInitial());
    bottomNavIndex = index;

    emit(ChangeCurrentSelectedBottomNavIndex());
  }

  Future<void> getUser() async {
    emit(GetUserLoading());
    final res = await _getProviderDataUseCase(NoParams());
    res.fold(
      (l) => emit(GetUserFailure(l.message)),
      (user) {
        this.user = user;
        emit(GetUserSuccess());
      },
    );
  }
}
