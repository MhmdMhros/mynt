import 'package:injectable/injectable.dart';
import 'package:mynt/core/models/no_data.dart';
import 'package:mynt/data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class LogoutUseCase implements BaseUseCase<NoData, LogoutRequest> {
  final Repository _repo;
  LogoutUseCase(this._repo);

  @override
  Future<Either<Failure, NoData>> call(LogoutRequest params) async =>
      _repo.logout(params);
}
