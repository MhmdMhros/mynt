import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/request_service_data.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class GetRequestServiceDataUsecase
    implements BaseUseCase<RequestServiceData, NoParams> {
  final Repository _repo;
  GetRequestServiceDataUsecase(this._repo);

  @override
  Future<Either<Failure, RequestServiceData>> call(NoParams params) async =>
      _repo.requestServiceData();
}
