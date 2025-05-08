import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/send_otp.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class SendOtpUsecase implements BaseUseCase<SendOtp, SendOtpRequest> {
  final Repository _repo;
  SendOtpUsecase(this._repo);

  @override
  Future<Either<Failure, SendOtp>> call(SendOtpRequest params) async =>
      _repo.sendOtp(params);
}
