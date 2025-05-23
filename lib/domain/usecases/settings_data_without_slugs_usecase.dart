import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/settings_data_without_slug.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class SettingsDataWithoutSlugsUsecase
    implements BaseUseCase<SettingsDataWithoutSlug, NoParams> {
  final Repository _repo;
  SettingsDataWithoutSlugsUsecase(this._repo);

  @override
  Future<Either<Failure, SettingsDataWithoutSlug>> call(
          NoParams params) async =>
      _repo.settingsDataWithoutSlugs();
}
