import 'package:injectable/injectable.dart';
import 'package:mynt/data/requests/requests.dart';

import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../core/models/no_data.dart';

@lazySingleton
class EditAccountDataUsecase
    implements BaseUseCase<NoData, EditAccountDataRequest> {
  final Repository _repo;
  EditAccountDataUsecase(this._repo);

  @override
  Future<Either<Failure, NoData>> call(EditAccountDataRequest params) async =>
      _repo.editAccountData(params);
}
