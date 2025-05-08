import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/otp_verification_success.dart';

@lazySingleton
class OtpVerificationUsecase
    implements BaseUseCase<OtpVerificationSuccess, OtpVerificationRequest> {
  final Repository _repo;
  OtpVerificationUsecase(this._repo);

  @override
  Future<Either<Failure, OtpVerificationSuccess>> call(
          OtpVerificationRequest params) async =>
      _repo.otpVerification(params);
}
