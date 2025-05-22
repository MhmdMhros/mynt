part of 'request_service_cubit.dart';

abstract class RequestServiceState extends Equatable {
  const RequestServiceState();

  @override
  List<Object?> get props => [];
}

class RequestServiceInitial extends RequestServiceState {}

class RequestServiceImagesUpdated extends RequestServiceState {
  final List<File> images;

  const RequestServiceImagesUpdated(this.images);

  @override
  List<Object?> get props => [images];
}

class GetRequestServiceDataLoading extends RequestServiceState {}

class GetRequestServiceDataSuccess extends RequestServiceState {}

class GetRequestServiceDataFailure extends RequestServiceState {
  final String error;
  const GetRequestServiceDataFailure(this.error);
}

class SubmitTicketLoading extends RequestServiceState {}

class SubmitTicketSuccess extends RequestServiceState {
  final String message;

  const SubmitTicketSuccess(this.message);
}

class SubmitTicketFailure extends RequestServiceState {
  final String error;

  const SubmitTicketFailure(this.error);
}

class UpdateUnitIdAndTitleState extends RequestServiceState {
  final String unitId;
  final String unitTitle;

  const UpdateUnitIdAndTitleState(this.unitId, this.unitTitle);
  @override
  List<Object?> get props => [unitId, unitTitle];
}

class UpdateServiceTitleIdState extends RequestServiceState {
  final String serviceId;
  final String serviceTitle;

  const UpdateServiceTitleIdState(this.serviceId, this.serviceTitle);
  @override
  List<Object?> get props => [serviceId, serviceTitle];
}
