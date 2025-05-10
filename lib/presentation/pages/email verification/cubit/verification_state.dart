// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'verification_cubit.dart';

sealed class VerificationState extends Equatable {
  const VerificationState();

  @override
  List<Object> get props => [];
}

final class VerificationInitial extends VerificationState {}

final class VerificationLoading extends VerificationState {}

final class VerificationSuccess extends VerificationState {}

final class VerificationError extends VerificationState {
  final String error;
  const VerificationError(this.error);
}

final class SendOtpSuccess extends VerificationState {}

final class SendOtpError extends VerificationState {
  final String error;
  const SendOtpError(this.error);
}

class EditAccountDataLoading extends VerificationState {}

class EditAccountDataSuccess extends VerificationState {}

class EditAccountDataFailure extends VerificationState {
  final String message;
  const EditAccountDataFailure(this.message);

  @override
  List<Object> get props => [message];
}

class EditEmailLoading extends VerificationState {}

class EditEmailSuccess extends VerificationState {}

class EditEmailFailure extends VerificationState {
  final String message;
  const EditEmailFailure(this.message);

  @override
  List<Object> get props => [message];
}

class EditPhoneLoading extends VerificationState {}

class EditPhoneSuccess extends VerificationState {}

class EditPhoneFailure extends VerificationState {
  final String message;
  const EditPhoneFailure(this.message);

  @override
  List<Object> get props => [message];
}

final class CreatePasswordLoading extends VerificationState {}

final class CreatePasswordSuccess extends VerificationState {}

final class CreatePasswordError extends VerificationState {
  final String error;
  const CreatePasswordError(this.error);
}
