part of 'request_service_cubit.dart';

sealed class RequestServiceState extends Equatable {
  const RequestServiceState();

  @override
  List<Object> get props => [];
}

final class RequestServiceInitial extends RequestServiceState {}
