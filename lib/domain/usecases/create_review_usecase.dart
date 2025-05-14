import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/review_success.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class CreateReviewUsecase
    implements BaseUseCase<ReviewSuccess, CreateReviewRequest> {
  final Repository _repo;
  CreateReviewUsecase(this._repo);

  @override
  Future<Either<Failure, ReviewSuccess>> call(
          CreateReviewRequest params) async =>
      _repo.createReview(params);
}
