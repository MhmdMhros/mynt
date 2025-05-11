import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/dashboard_data.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class GetHomeDataUsecase implements BaseUseCase<DashboardData, NoParams> {
  final Repository _repo;
  GetHomeDataUsecase(this._repo);

  @override
  Future<Either<Failure, DashboardData>> call(NoParams params) async =>
      _repo.dashboardData();
}
