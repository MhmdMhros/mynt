// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/core/common/pagination/list_page.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/notification.dart';
import 'package:mynt/domain/usecases/get_notifications_data_usecase.dart';
import 'package:mynt/domain/usecases/read_notification_usecase.dart';

part 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(
      this._getNotificationsDataUsecase, this._readNotificationUsecase)
      : super(NotificationsInitial());
  final GetNotificationsDataUsecase _getNotificationsDataUsecase;
  final ReadNotificationUsecase _readNotificationUsecase;

  static NotificationsCubit get(BuildContext context) =>
      BlocProvider.of(context);

  PagingController<int, Notification_R> pagingController =
      PagingController<int, Notification_R>(
    firstPageKey: 1,
  );

  Future<ListPage<Notification_R>> getNotifications(int page, int limit) async {
    emit(GetNotificationsLoading());
    final res = await _getNotificationsDataUsecase(
      GetAllNotificationsRequest(query: {
        'page': page,
        'paginate': limit,
      }),
    );
    return res.fold(
      (l) {
        emit(GetNotificationsFailure(l.message));
        throw l.message;
      },
      (r) {
        emit(GetNotificationsSuccess());
        return ListPage(
          grandTotalCount: r.total,
          itemList: r.notifications,
        );
      },
    );
  }

  Future<bool> readNtification(String notificationId) async {
    emit(ReadNotificationLoading());
    final res = await _readNotificationUsecase(notificationId);

    return await res.fold(
      (f) {
        emit(ReadNotificationFailure(f.message));
        return false;
      },
      (s) {
        emit(ReadNotificationSuccess());
        // تعديل العنصر داخل PagingController
        final currentItems = pagingController.itemList;
        if (currentItems == null) return true;

        final index = currentItems
            .indexWhere((item) => item.id.toString() == notificationId);
        if (index != -1) {
          final updatedItem = currentItems[index].copyWith(readAt: 'true');
          final updatedItems = [...currentItems];
          updatedItems[index] = updatedItem;

          pagingController.itemList = updatedItems;
        }
        return true;
      },
    );
  }
}
