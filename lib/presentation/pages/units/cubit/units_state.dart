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

class GetBookingAccountSummaryLoading extends UnitsState {}

class GetBookingAccountSummarySuccess extends UnitsState {}

class GetBookingAccountSummaryFailure extends UnitsState {
  final String error;

  const GetBookingAccountSummaryFailure(this.error);
}

class BookingDetailsLoading extends UnitsState {}

class BookingDetailsLoaded extends UnitsState {
  final Booking booking;

  const BookingDetailsLoaded(this.booking);
}

class BookingDetailsError extends UnitsState {
  final String message;

  const BookingDetailsError(this.message);
}
