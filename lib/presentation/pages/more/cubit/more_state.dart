// More_state.dart
part of 'more_cubit.dart';

abstract class MoreState extends Equatable {
  const MoreState();

  @override
  List<Object?> get props => [];
}

class MoreInitial extends MoreState {}

class GetSettingsDataLoading extends MoreState {}

class GetSettingsDataSuccess extends MoreState {}

class GetSettingsDataFailure extends MoreState {
  final String message;
  const GetSettingsDataFailure(this.message);
}

class GetSettingsDataWithoutSlugsLoading extends MoreState {}

class GetSettingsDataWithoutSlugsSuccess extends MoreState {}

class GetSettingsDataWithoutSlugsFailure extends MoreState {
  final String message;
  const GetSettingsDataWithoutSlugsFailure(this.message);
}

class LogoutLoading extends MoreState {}

class LogoutSuccess extends MoreState {}

class LogoutFailure extends MoreState {
  final String message;
  const LogoutFailure(this.message);
}
