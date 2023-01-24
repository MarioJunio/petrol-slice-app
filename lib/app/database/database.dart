import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:petrol_slice/app/database/database_key.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  late final Future<Database> _database;

  DatabaseProvider() {
    _database = _createDatabase();
  }

  Future<Database> get database => _database;

  Future<Database> _createDatabase() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();

    final String path =
        join(documentsDirectory.path, DatabaseKeys.databaseFilename);

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE ${DatabaseKeys.mapTable} ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
          "name TEXT,"
          "description TEXT,"
          "ethanol REAL,"
          "gasoline REAL"
          ")");

      await db.execute("CREATE TABLE ${DatabaseKeys.gasStationTable} ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
          "name TEXT,"
          "ethanol REAL,"
          "gasoline REAL"
          ")");
    });
  }
}
