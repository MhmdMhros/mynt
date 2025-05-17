import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/images_data.dart';
import '../../data/requests/requests.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class UploadTicketImagesUsecase
    implements BaseUseCase<ImagesData, UploadImagesRequest> {
  final Repository _repo;
  UploadTicketImagesUsecase(this._repo);

  @override
  Future<Either<Failure, ImagesData>> call(UploadImagesRequest params) async =>
      _repo.uploadTicketImages(params);
}
