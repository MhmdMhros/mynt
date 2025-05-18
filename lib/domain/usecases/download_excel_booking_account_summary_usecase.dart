import 'package:injectable/injectable.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/download_excel_success.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class DownloadExcelBookingAccountSummaryUsecase
    implements
        BaseUseCase<DownloadExcelSuccess,
            DownloadExcelBookingAccountSummaryRequest> {
  final Repository _repo;
  DownloadExcelBookingAccountSummaryUsecase(this._repo);

  @override
  Future<Either<Failure, DownloadExcelSuccess>> call(
          DownloadExcelBookingAccountSummaryRequest params) async =>
      _repo.downloadExcelBookingAccountSummary(params);
}
