part of 'layout_cubit.dart';

sealed class LayoutState extends Equatable {
  const LayoutState();

  @override
  List<Object> get props => [];
}

final class LayoutInitial extends LayoutState {}

final class ChangeCurrentSelectedBottomNavIndex extends LayoutState {}

final class UpdateUserSuccess extends LayoutState {}

final class GetUserLoading extends LayoutState {}

final class GetUserSuccess extends LayoutState {}

final class GetUserFailure extends LayoutState {
  final String message;

  const GetUserFailure(this.message);
}

final class RefreshTokenLoading extends LayoutState {}

final class RefreshTokenSuccess extends LayoutState {}

final class RefreshTokenFailure extends LayoutState {
  final String message;

  const RefreshTokenFailure(this.message);
}

class GetSettingsDataLoading extends LayoutState {}

class GetSettingsDataSuccess extends LayoutState {}

class GetSettingsDataFailure extends LayoutState {
  final String message;
  const GetSettingsDataFailure(this.message);
}

class LogoutLoading extends LayoutState {}

class LogoutSuccess extends LayoutState {}

class LogoutFailure extends LayoutState {
  final String message;
  const LogoutFailure(this.message);
}

class SocketDataUpdated extends LayoutState {
  final dynamic data;
  const SocketDataUpdated(this.data);

  @override
  List<Object> get props => [data];
}

final class SendOtpSuccess extends LayoutState {}

final class SendOtpError extends LayoutState {
  final String error;
  const SendOtpError(this.error);
}
