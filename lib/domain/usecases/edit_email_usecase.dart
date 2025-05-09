import 'package:injectable/injectable.dart';
import 'package:mynt/data/requests/requests.dart';

import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';
import '../../core/models/no_data.dart';

@lazySingleton
class EditEmailUsecase implements BaseUseCase<NoData, EditEmailRequest> {
  final Repository _repo;
  EditEmailUsecase(this._repo);

  @override
  Future<Either<Failure, NoData>> call(EditEmailRequest params) async =>
      _repo.editAccountEmail(params);
}
