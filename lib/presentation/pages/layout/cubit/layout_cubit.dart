// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/base_usecase.dart';
import 'package:mynt/core/user_secure_storage.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/di.dart';
import 'package:mynt/domain/entities/dashboard_data.dart';
import 'package:mynt/domain/entities/user.dart';
import 'package:mynt/domain/usecases/get_user_usecase.dart';
import 'package:mynt/domain/usecases/refresh_token_usecase.dart';
import 'package:mynt/domain/usecases/send_otp_usecase.dart';
import 'package:mynt/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:mynt/presentation/pages/more/more_screen.dart';
import 'package:mynt/presentation/pages/tickets/tickets_screen.dart';
import 'package:mynt/presentation/pages/units/units_screen.dart';

part 'layout_state.dart';

@injectable
class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit(
    this._getUserUseCase,
    this._refreshTokenUsecase,
    this._sendOtpUsecase,
  ) : super(LayoutInitial());
  final GetUserUseCase _getUserUseCase;
  final RefreshTokenUsecase _refreshTokenUsecase;

  final SendOtpUsecase _sendOtpUsecase;

  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  User? user;
  DashboardData? dashboardData;
  bool isConnected = false;

  int bottomNavIndex = 0;

  void resetBottomNavIndex() => bottomNavIndex = 0;
  Widget get currentScreen => screens[bottomNavIndex];

  final List<Widget> screens = [
    const DashBoardScreen(),
    const UnitsScreen(),
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

  Future<int> getUser() async {
    emit(GetUserLoading());
    final res = await _getUserUseCase(NoParams());
    return await res.fold(
      (l) {
        emit(GetUserFailure(l.message));
        showToast(l.code.toString(), ToastType.info);
        return l.code;
      },
      (user) {
        this.user = user;
        emit(GetUserSuccess());
        return 200;
      },
    );
  }

  Future<bool> sendOtp(String userName) async {
    final result = await _sendOtpUsecase(
      SendOtpRequest(identifier: userName),
    );
    return await result.fold(
      (failure) {
        showToast('Failed to send verification code. Please try again later.',
            ToastType.error);
        emit(SendOtpError(failure.message));
        return false;
      },
      (success) {
        emit(SendOtpSuccess());
        return true;
      },
    );
  }

  Future<void> editData() async {
    final success = await getUser();
    if (success == 200) {
      await getIt<UserSecureStorage>().upsertUserInfo(
        email: user!.email,
      );
      showToast('Doneeeeeeeeeeeeeeeeeeeeee.', ToastType.success);
    }
  }

  void checkLayoutConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      isConnected = true;
      emit(LayoutConnectivityChanged(isConnected));
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      isConnected = true;
      emit(LayoutConnectivityChanged(isConnected));
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      isConnected = true;
      emit(LayoutConnectivityChanged(isConnected));
    } else {
      isConnected = false;
      emit(LayoutConnectivityChanged(isConnected));
    }
  }
}
