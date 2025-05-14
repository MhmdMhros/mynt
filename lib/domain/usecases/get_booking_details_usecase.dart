import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/booking.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class GetBookingDetailsUsecase implements BaseUseCase<Booking, String> {
  final Repository _repo;
  GetBookingDetailsUsecase(this._repo);

  @override
  Future<Either<Failure, Booking>> call(String params) async =>
      _repo.getBookingDetails(params);
}
