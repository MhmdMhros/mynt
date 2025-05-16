// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/core/base_usecase.dart';
import 'package:mynt/domain/entities/dashboard_data.dart';
import 'package:mynt/domain/usecases/get_home_data_usecase.dart';
import 'package:mynt/domain/usecases/get_un_read_notifications_count_usecase.dart';

part 'dashboard_state.dart';

@injectable
class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(
      this._getHomeDataUsecase, this._getUnReadNotificationsCountUsecase)
      : super(DashboardInitial());
  final GetHomeDataUsecase _getHomeDataUsecase;
  final GetUnReadNotificationsCountUsecase _getUnReadNotificationsCountUsecase;

  static DashboardCubit get(BuildContext context) => BlocProvider.of(context);

  DashboardData? dashboardData;
  int unreadNotificationsCount = 0;

  Future<bool> getHomeData() async {
    emit(GetHomeDataLoading());
    final res = await _getHomeDataUsecase(NoParams());

    return await res.fold(
      (failure) {
        emit(GetHomeDataFailure(failure.message));
        return false;
      },
      (dashboardData) {
        this.dashboardData = dashboardData;
        emit(GetHomeDataSuccess());
        return true;
      },
    );
  }

  Future<void> getUnreadNotificationsCount() async {
    emit(GetUnreadNotificationsCountLoading());

    final result = await _getUnReadNotificationsCountUsecase(NoParams());

    result.fold(
      (failure) {
        emit(GetUnreadNotificationsCountFailure(failure.message));
      },
      (unReadCountData) {
        unreadNotificationsCount = unReadCountData.unReadCount;
        emit(GetUnreadNotificationsCountSuccess());
      },
    );
  }

  void decreamentCountOfNotifications() {
    unreadNotificationsCount--;
    emit(DecreamentUnreadNotificationsCountSuccess());
  }
}
