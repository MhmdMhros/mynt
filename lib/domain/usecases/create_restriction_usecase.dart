import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/restriction_success.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class CreateRestrictionUsecase
    implements BaseUseCase<RestrictionSuccess, CreateRestrictionRequest> {
  final Repository _repo;
  CreateRestrictionUsecase(this._repo);

  @override
  Future<Either<Failure, RestrictionSuccess>> call(
          CreateRestrictionRequest params) async =>
      _repo.createRestriction(params);
}
