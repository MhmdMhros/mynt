import 'package:injectable/injectable.dart';
import 'package:mynt/core/models/no_data.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class CheckAccountUsecase implements BaseUseCase<NoData, CheckAccountRequest> {
  final Repository _repo;
  CheckAccountUsecase(this._repo);

  @override
  Future<Either<Failure, NoData>> call(CheckAccountRequest params) async =>
      _repo.checkAccount(params);
}
