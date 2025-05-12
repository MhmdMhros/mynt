// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/base_usecase.dart';
import 'package:mynt/domain/entities/notifications_data.dart';
import 'package:mynt/domain/usecases/get_notifications_data_usecase.dart';

part 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._getNotificationsDataUsecase)
      : super(NotificationsInitial());
  final GetNotificationsDataUsecase _getNotificationsDataUsecase;

  static NotificationsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  NotificationsData? notificationsData;

  Future<bool> getNotifications() async {
    emit(GetNotificationsLoading());
    final res = await _getNotificationsDataUsecase(NoParams());

    return await res.fold(
      (failure) {
        showToast('Failed!!!.', ToastType.error);
        emit(GetNotificationsFailure(failure.message));
        return false;
      },
      (notificationsData) {
        this.notificationsData = notificationsData;
        emit(GetNotificationsSuccess());
        return true;
      },
    );
  }
}
