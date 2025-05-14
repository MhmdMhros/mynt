import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/create_ticket_success.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class CreateTicketUsecase
    implements BaseUseCase<CreateTicketSuccess, CreateTicketRequest> {
  final Repository _repo;
  CreateTicketUsecase(this._repo);

  @override
  Future<Either<Failure, CreateTicketSuccess>> call(
          CreateTicketRequest params) async =>
      _repo.createTicket(params);
}
