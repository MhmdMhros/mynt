import 'package:injectable/injectable.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../domain/entities/user.dart';

@lazySingleton
class UpdateUserUseCase implements BaseUseCase<User, UpdateUserRequest> {
  final Repository _repo;
  UpdateUserUseCase(this._repo);

  @override
  Future<Either<Failure, User>> call(UpdateUserRequest params) async =>
      _repo.updateUser(params);
}
