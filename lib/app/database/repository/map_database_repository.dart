import 'package:petrol_slice/app/database/database.dart';
import 'package:petrol_slice/app/database/database_key.dart';
import 'package:petrol_slice/app/shared/models/map_model.dart';

class MapDatabaseRepository {
  late final DatabaseProvider databaseProvider;
  late final String tableName;

  MapDatabaseRepository(this.databaseProvider) {
    tableName = DatabaseKeys.mapTable;
  }

  Future<MapModel?> read(int id) async {
    final List<Map<String, Object?>> result =
        await (await databaseProvider.database).query(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );

    return result.isNotEmpty ? MapModel.fromMap(result.first) : null;
  }

  Future<MapModel> save(MapModel mapModel) async {
    final int mapId = await (await databaseProvider.database)
        .insert(tableName, mapModel.toMap());

    return mapModel.copyWith(id: mapId);
  }

  Future<int> update(MapModel mapModel) async {
    return await (await databaseProvider.database).update(
      tableName,
      mapModel.toDatabaseMap(),
      where: "id = ?",
      whereArgs: [mapModel.id],
    );
  }

  Future<List<MapModel>> readAll() async {
    final List<Map<String, Object?>> result =
        await (await databaseProvider.database).query(
      tableName,
    );

    return result.map((map) => MapModel.fromMap(map)).toList();
  }

  Future<int> delete(int id) async {
    return await (await databaseProvider.database).delete(
      tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
