part of 'units_cubit.dart';

sealed class UnitsState extends Equatable {
  const UnitsState();

  @override
  List<Object> get props => [];
}

final class UnitsInitial extends UnitsState {}

class GetUnitsLoading extends UnitsState {}

class GetUnitsSuccess extends UnitsState {}

class GetUnitsFailure extends UnitsState {
  final String message;
  const GetUnitsFailure(this.message);
}

class CreateRestrictionLoading extends UnitsState {}

class CreateRestrictionSuccess extends UnitsState {}

class CreateRestrictionFailure extends UnitsState {
  final String error;

  const CreateRestrictionFailure(this.error);
}
