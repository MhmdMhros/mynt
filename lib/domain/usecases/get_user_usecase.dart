import 'package:injectable/injectable.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/user.dart';

@lazySingleton
class GetUserUseCase implements BaseUseCase<User, NoParams> {
  final Repository _repo;
  GetUserUseCase(this._repo);

  @override
  Future<Either<Failure, User>> call(NoParams params) async => _repo.getUser();
}
