part of 'tickets_cubit.dart';

sealed class TicketsState extends Equatable {
  const TicketsState();

  @override
  List<Object> get props => [];
}

final class TicketsInitial extends TicketsState {}

class GetTicketsLoading extends TicketsState {}

class GetTicketsSuccess extends TicketsState {}

class GetTicketsFailure extends TicketsState {
  final String message;
  const GetTicketsFailure(this.message);
}
