import 'package:injectable/injectable.dart';
import 'package:mynt/core/models/no_data.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class ReadNotificationUsecase implements BaseUseCase<NoData, String> {
  final Repository _repo;
  ReadNotificationUsecase(this._repo);

  @override
  Future<Either<Failure, NoData>> call(String params) async =>
      _repo.readNotification(params);
}
