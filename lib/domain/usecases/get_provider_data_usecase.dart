import 'package:injectable/injectable.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../entities/user.dart';

@lazySingleton
class GetProviderDataUseCase implements BaseUseCase<User, NoParams> {
  final Repository _repo;
  GetProviderDataUseCase(this._repo);

  @override
  Future<Either<Failure, User>> call(NoParams params) async =>
      _repo.getProviderData();
}
