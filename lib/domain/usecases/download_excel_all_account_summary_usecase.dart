import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/download_excel_success.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class DownloadExcelAllAccountSummaryUsecase
    implements BaseUseCase<DownloadExcelSuccess, NoParams> {
  final Repository _repo;
  DownloadExcelAllAccountSummaryUsecase(this._repo);

  @override
  Future<Either<Failure, DownloadExcelSuccess>> call(NoParams params) async =>
      _repo.downloadExcelAllAccountSummary();
}
