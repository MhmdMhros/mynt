// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  final String error;
  const LoginError(this.error);
}

final class InitialEmailAndPasswordSuccess extends LoginState {}

final class InitialEmailAndPasswordError extends LoginState {}

final class SendOtpSuccess extends LoginState {}

final class VerifyOtpLoading extends LoginState {}

final class VerifyOtpSuccess extends LoginState {
  final String message;
  const VerifyOtpSuccess(this.message);
}

final class VerifyOtpError extends LoginState {
  final String error;
  const VerifyOtpError(this.error);
}

class LoginConnectivityChanged extends LoginState {
  final bool isConnected;

  const LoginConnectivityChanged(this.isConnected);

  @override
  List<Object> get props => [isConnected];
}
