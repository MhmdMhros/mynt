import 'package:injectable/injectable.dart';
import 'package:mynt/domain/entities/settings_data.dart';
import '../repository/repository.dart';
import '../../core/base_usecase.dart';
import 'package:dartz/dartz.dart';
import '../../core/network/failure.dart';

@lazySingleton
class SettingsDataUsecase implements BaseUseCase<SettingsData, NoParams> {
  final Repository _repo;
  SettingsDataUsecase(this._repo);

  @override
  Future<Either<Failure, SettingsData>> call(NoParams params) async =>
      _repo.settingsData();
}
