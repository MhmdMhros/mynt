import 'package:injectable/injectable.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/download_pdf_success.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class DownloadPdfBookingAccountSummaryUsecase
    implements
        BaseUseCase<DownloadPdfSuccess,
            DownloadPdfBookingAccountSummaryRequest> {
  final Repository _repo;
  DownloadPdfBookingAccountSummaryUsecase(this._repo);

  @override
  Future<Either<Failure, DownloadPdfSuccess>> call(
          DownloadPdfBookingAccountSummaryRequest params) async =>
      _repo.downloadPDFBookingAccountSummary(params);
}
