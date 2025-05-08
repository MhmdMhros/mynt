import 'package:injectable/injectable.dart';

import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../core/models/no_data.dart';

@lazySingleton
class DeleteAccountUseCase implements BaseUseCase<NoData, NoParams> {
  final Repository _repo;
  DeleteAccountUseCase(this._repo);

  @override
  Future<Either<Failure, NoData>> call(NoParams params) async =>
      _repo.deleteAccount();
}
