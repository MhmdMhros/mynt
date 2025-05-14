import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/un_read_notifications_count.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class GetUnReadNotificationsCountUsecase
    implements BaseUseCase<UnReadNotificationsCount, NoParams> {
  final Repository _repo;
  GetUnReadNotificationsCountUsecase(this._repo);

  @override
  Future<Either<Failure, UnReadNotificationsCount>> call(
          NoParams params) async =>
      _repo.getUnReadNotificationsCount();
}
