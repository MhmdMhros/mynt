import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/reset_password_success.dart';

@lazySingleton
class ResetPasswordUseCase
    implements BaseUseCase<ResetPasswordSuccess, ResetPasswordRequest> {
  final Repository _repo;
  ResetPasswordUseCase(this._repo);

  @override
  Future<Either<Failure, ResetPasswordSuccess>> call(
          ResetPasswordRequest params) async =>
      _repo.resetPassword(params);
}
