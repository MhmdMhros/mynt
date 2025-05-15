part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitial extends NotificationsState {}

class GetNotificationsLoading extends NotificationsState {}

class GetNotificationsSuccess extends NotificationsState {}

class GetNotificationsFailure extends NotificationsState {
  final String message;
  const GetNotificationsFailure(this.message);
}

class ReadNotificationLoading extends NotificationsState {}

class ReadNotificationSuccess extends NotificationsState {}

class ReadNotificationFailure extends NotificationsState {
  final String message;
  const ReadNotificationFailure(this.message);
}
