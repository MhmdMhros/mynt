import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/verify_reset_password_otp_success.dart';

@lazySingleton
class VerifyResetPasswordOtpUseCase
    implements
        BaseUseCase<VerifyResetPasswordOtpSuccess,
            VerifyResetPasswordOtpRequest> {
  final Repository _repo;
  VerifyResetPasswordOtpUseCase(this._repo);

  @override
  Future<Either<Failure, VerifyResetPasswordOtpSuccess>> call(
          VerifyResetPasswordOtpRequest params) async =>
      _repo.verifyResetPasswordOtp(params);
}
