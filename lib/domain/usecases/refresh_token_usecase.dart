import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/refresh_token_success.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class RefreshTokenUsecase
    implements BaseUseCase<RefreshTokenSuccess, RefreshTokenRequest> {
  final Repository _repo;
  RefreshTokenUsecase(this._repo);

  @override
  Future<Either<Failure, RefreshTokenSuccess>> call(
          RefreshTokenRequest params) async =>
      _repo.refreshToken(params);
}
