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

final class SendOtpSuccess extends LayoutState {}

final class SendOtpError extends LayoutState {
  final String error;
  const SendOtpError(this.error);
}

class LayoutConnectivityChanged extends LayoutState {
  final bool isConnected;

  const LayoutConnectivityChanged(this.isConnected);

  @override
  List<Object> get props => [isConnected];
}
