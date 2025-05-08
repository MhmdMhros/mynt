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
