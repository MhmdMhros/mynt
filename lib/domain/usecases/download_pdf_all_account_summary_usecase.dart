import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/download_pdf_success.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class DownloadPdfAllAccountSummaryUsecase
    implements BaseUseCase<DownloadPdfSuccess, NoParams> {
  final Repository _repo;
  DownloadPdfAllAccountSummaryUsecase(this._repo);

  @override
  Future<Either<Failure, DownloadPdfSuccess>> call(NoParams params) async =>
      _repo.downloadPDFAllAccountSummary();
}
