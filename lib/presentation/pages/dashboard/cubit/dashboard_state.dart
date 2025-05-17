part of 'dashboard_cubit.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

class GetHomeDataLoading extends DashboardState {}

class GetHomeDataSuccess extends DashboardState {}

class GetHomeDataFailure extends DashboardState {
  final String message;
  const GetHomeDataFailure(this.message);
}

class GetUnreadNotificationsCountLoading extends DashboardState {}

class GetUnreadNotificationsCountSuccess extends DashboardState {}

class GetUnreadNotificationsCountFailure extends DashboardState {
  final String message;
  const GetUnreadNotificationsCountFailure(this.message);
}

class DecreamentUnreadNotificationsCountSuccess extends DashboardState {}

class GetAccountSummaryLoading extends DashboardState {}

class GetAccountSummarySuccess extends DashboardState {}

class GetAccountSummaryFailure extends DashboardState {
  final String error;
  const GetAccountSummaryFailure(this.error);
}
