import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/forget_password_success.dart';

@lazySingleton
class ForgetPasswordUseCase
    implements BaseUseCase<ForgetPasswordSuccess, ForgetPasswordRequest> {
  final Repository _repo;
  ForgetPasswordUseCase(this._repo);

  @override
  Future<Either<Failure, ForgetPasswordSuccess>> call(
          ForgetPasswordRequest params) async =>
      _repo.forgetPassword(params);
}
