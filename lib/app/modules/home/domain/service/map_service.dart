import 'package:petrol_slice/app/database/repository/map_database_repository.dart';
import 'package:petrol_slice/app/shared/models/map_model.dart';

class MapService {
  final MapDatabaseRepository _mapDatabaseRepository;

  MapService(this._mapDatabaseRepository);

  Future<MapModel> create(MapModel mapModel) async {
    return await _mapDatabaseRepository.save(mapModel);
  }

  Future<int> update(MapModel mapModel) async {
    return await _mapDatabaseRepository.update(mapModel);
  }

  Future<MapModel?> read(int id) async {
    return await _mapDatabaseRepository.read(id);
  }

  Future<List<MapModel>> readAll() async {
    return await _mapDatabaseRepository.readAll();
  }

  Future<int> delete(int id) async {
    return await _mapDatabaseRepository.delete(id);
  }
}
