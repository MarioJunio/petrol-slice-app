import 'package:petrol_slice/app/database/database.dart';
import 'package:petrol_slice/app/database/database_key.dart';
import 'package:petrol_slice/app/shared/models/gas_station_model.dart';

class GasStationDatabaseRepository {
  late final DatabaseProvider databaseProvider;
  late final String tableName;

  GasStationDatabaseRepository(this.databaseProvider) {
    tableName = DatabaseKeys.gasStationTable;
  }

  Future<GasStationModel?> read(int id) async {
    final List<Map<String, Object?>> result =
        await (await databaseProvider.database).query(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );

    return result.isNotEmpty ? GasStationModel.fromMap(result.first) : null;
  }

  Future<GasStationModel> save(GasStationModel gasStationModel) async {
    final int gasStationId = await (await databaseProvider.database)
        .insert(tableName, gasStationModel.toDatabaseMap());

    return gasStationModel.copyWith(id: gasStationId);
  }

  Future<int> update(GasStationModel gasStationModel) async {
    return await (await databaseProvider.database).update(
      tableName,
      gasStationModel.toDatabaseMap(),
      where: "id = ?",
      whereArgs: [gasStationModel.id],
    );
  }

  Future<List<GasStationModel>> readAll() async {
    final List<Map<String, Object?>> result =
        await (await databaseProvider.database).query(
      tableName,
    );

    return result.map((map) => GasStationModel.fromMap(map)).toList();
  }

  Future<int> delete(int id) async {
    return await (await databaseProvider.database).delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
