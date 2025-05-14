import 'package:injectable/injectable.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/tickets_data.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class GetTicketsDataUsecase
    implements BaseUseCase<TicketsData, GetAllTicketsRequest> {
  final Repository _repo;
  GetTicketsDataUsecase(this._repo);

  @override
  Future<Either<Failure, TicketsData>> call(
          GetAllTicketsRequest params) async =>
      _repo.ticketsData(params);
}
