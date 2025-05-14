import 'package:injectable/injectable.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/notifications_data.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class GetNotificationsDataUsecase
    implements BaseUseCase<NotificationsData, GetAllNotificationsRequest> {
  final Repository _repo;
  GetNotificationsDataUsecase(this._repo);

  @override
  Future<Either<Failure, NotificationsData>> call(
          GetAllNotificationsRequest params) async =>
      _repo.notificationsData(params);
}
