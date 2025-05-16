// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:mynt/domain/usecases/create_ticket_usecase.dart';

part 'request_service_state.dart';

@injectable
class RequestServiceCubit extends Cubit<RequestServiceState> {
  RequestServiceCubit(this._createTicketUsecase)
      : super(RequestServiceInitial());
  final CreateTicketUsecase _createTicketUsecase;

  static RequestServiceCubit get(BuildContext context) =>
      BlocProvider.of(context);
}
