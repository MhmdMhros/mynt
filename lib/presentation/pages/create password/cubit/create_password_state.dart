// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'create_password_cubit.dart';

sealed class CreatePasswordState extends Equatable {
  const CreatePasswordState();

  @override
  List<Object> get props => [];
}

final class CreatePasswordInitial extends CreatePasswordState {}

final class CreatePasswordLoading extends CreatePasswordState {}

final class CreatePasswordSuccess extends CreatePasswordState {}

final class CreatePasswordError extends CreatePasswordState {
  final String error;
  const CreatePasswordError(this.error);
}
