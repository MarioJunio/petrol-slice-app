import 'package:flutter_modular/flutter_modular.dart';
import 'package:petrol_slice/app/database/database.dart';
import 'package:petrol_slice/app/database/repository/gas_station_database_repository.dart';
import 'package:petrol_slice/app/database/repository/map_database_repository.dart';
import 'package:petrol_slice/app/modules/home/domain/service/gas_station_service.dart';
import 'package:petrol_slice/app/modules/home/domain/service/map_service.dart';
import 'package:petrol_slice/app/modules/home/domain/service/preferences_service.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DatabaseProvider()),
    Bind.lazySingleton((i) => MapDatabaseRepository(i())),
    Bind.lazySingleton((i) => GasStationDatabaseRepository(i())),
    Bind.lazySingleton((i) => MapService(i())),
    Bind.lazySingleton((i) => GasStationService(i())),
    Bind.lazySingleton((i) => PreferenceService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: HomeModule(),
    ),
  ];
}
