import 'package:injectable/injectable.dart';
import 'package:mynt/data/requests/requests.dart';
import 'package:mynt/domain/entities/bookings_data.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class GetBookingsDataUsecase
    implements BaseUseCase<BookingsData, GetAllUnitsRequest> {
  final Repository _repo;
  GetBookingsDataUsecase(this._repo);

  @override
  Future<Either<Failure, BookingsData>> call(GetAllUnitsRequest params) async =>
      _repo.bookingsData(params);
}
