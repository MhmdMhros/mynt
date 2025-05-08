import 'package:injectable/injectable.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/logout_success.dart';

@lazySingleton
class LogoutUseCase implements BaseUseCase<LogoutSuccess, NoParams> {
  final Repository _repo;
  LogoutUseCase(this._repo);

  @override
  Future<Either<Failure, LogoutSuccess>> call(NoParams params) async =>
      _repo.logout();
}
