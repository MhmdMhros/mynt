// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/core/base_usecase.dart';
import 'package:mynt/core/user_secure_storage.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/di.dart';
import 'package:mynt/domain/entities/user.dart';
import 'package:mynt/domain/usecases/get_user_usecase.dart';
import 'package:mynt/domain/usecases/refresh_token_usecase.dart';
import 'package:mynt/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:mynt/presentation/pages/more/more_screen.dart';
import 'package:mynt/presentation/pages/tickets/tickets_screen.dart';
import 'package:mynt/presentation/pages/units/all_units_screen.dart';

part 'layout_state.dart';

@injectable
class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit(this._getUserUseCase, this._refreshTokenUsecase)
      : super(LayoutInitial());
  final GetUserUseCase _getUserUseCase;
  final RefreshTokenUsecase _refreshTokenUsecase;

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

  void changeCurrentSelectedBottomNavIndex(int index) {
    emit(LayoutInitial());
    bottomNavIndex = index;

    emit(ChangeCurrentSelectedBottomNavIndex());
  }

  Future<bool> refreshToken() async {
    emit(RefreshTokenLoading());
    final refreshToken = await getIt<UserSecureStorage>().getRefreshToken();
    if (refreshToken == null) {
      return false;
    }
    final res = await _refreshTokenUsecase(
        RefreshTokenRequest(refreshToken: refreshToken));
    return await res.fold(
      (l) {
        emit(RefreshTokenFailure(l.message));
        return false;
      },
      (refreshData) async {
        await getIt<UserSecureStorage>().updateAuthTokens(
            accessToken: refreshData.accessToken,
            expiresIn: refreshData.expiresIn,
            refreshToken: refreshData.refreshToken);
        emit(RefreshTokenSuccess());
        return true;
      },
    );
  }

  Future<bool> getUser() async {
    emit(GetUserLoading());
    final res = await _getUserUseCase(NoParams());
    return await res.fold(
      (l) {
        emit(GetUserFailure(l.message));
        return false;
      },
      (user) {
        this.user = user;
        emit(GetUserSuccess());
        return true;
      },
    );
  }
}
