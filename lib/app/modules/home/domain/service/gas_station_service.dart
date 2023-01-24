import 'package:petrol_slice/app/database/repository/gas_station_database_repository.dart';
import 'package:petrol_slice/app/shared/models/gas_station_model.dart';

class GasStationService {
  final GasStationDatabaseRepository _gasStationDatabaseRepository;

  GasStationService(this._gasStationDatabaseRepository);

  Future<GasStationModel> create(GasStationModel gasStationModel) async {
    return await _gasStationDatabaseRepository.save(gasStationModel);
  }

  Future<int> update(GasStationModel gasStationModel) async {
    return await _gasStationDatabaseRepository.update(gasStationModel);
  }

  Future<GasStationModel?> read(int id) async {
    return await _gasStationDatabaseRepository.read(id);
  }

  Future<List<GasStationModel>> readAll() async {
    return await _gasStationDatabaseRepository.readAll();
  }

  Future<int> delete(int id) async {
    return await _gasStationDatabaseRepository.delete(id);
  }
}
