part of 'my_profile_cubit.dart';

sealed class MyProfileState extends Equatable {
  const MyProfileState();

  @override
  List<Object> get props => [];
}

final class MyProfileInitial extends MyProfileState {}

final class MyProfileUpdateUserSuccess extends MyProfileState {}

final class MyProfileGetUserLoading extends MyProfileState {}

final class MyProfileGetUserSuccess extends MyProfileState {}

final class MyProfileGetUserFailure extends MyProfileState {
  final String message;

  const MyProfileGetUserFailure(this.message);
}

final class MyProfileSendOtpSuccess extends MyProfileState {}

final class MyProfileSendOtpError extends MyProfileState {
  final String error;
  const MyProfileSendOtpError(this.error);
}

class MyProfileEditAccountDataLoading extends MyProfileState {}

class MyProfileEditAccountDataSuccess extends MyProfileState {}

class MyProfileEditAccountDataFailure extends MyProfileState {
  final String message;
  const MyProfileEditAccountDataFailure(this.message);

  @override
  List<Object> get props => [message];
}
