import 'package:injectable/injectable.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/account_summary_data.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class Get
    implements
        BaseUseCase<AccountSummaryData, GetBookingAccountSummaryRequest> {
  final Repository _repo;
  GetBookingAccountSummaryUsecase(this._repo);

  @override
  Future<Either<Failure, AccountSummaryData>> call(
          GetBookingAccountSummaryRequest params) async =>
      _repo.bookingAccountSummaryData(params);
}
