import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/account_summary_data.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class GetAllAccountSummaryUsecase
    implements BaseUseCase<AccountSummaryData, NoParams> {
  final Repository _repo;
  GetAllAccountSummaryUsecase(this._repo);

  @override
  Future<Either<Failure, AccountSummaryData>> call(NoParams params) async =>
      _repo.allAccountSummaryData();
}
