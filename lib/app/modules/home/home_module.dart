import 'package:flutter_modular/flutter_modular.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/gas_station/add_gas_station/add_gas_station_controller.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/gas_station/add_gas_station/add_gas_station_page.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/gas_station/gas_stations_controller.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/gas_station/gas_stations_page.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/home/home_controller.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/home/home_page.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/home/result/result_page.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/maps/add_map/add_map_controller.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/maps/add_map/add_map_page.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/maps/maps_controller.dart';
import 'package:petrol_slice/app/modules/home/presentation/pages/maps/maps_page.dart';

import 'presentation/pages/welcome/welcome_controller.dart';
import 'presentation/pages/welcome/welcome_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => WelcomeController(i())),
    Bind.lazySingleton((i) => HomeController(i())),
    Bind.lazySingleton((i) => MapsController(i())),
    Bind.lazySingleton((i) => AddMapController(i())),
    Bind.lazySingleton((i) => GasStationsController(i())),
    Bind.lazySingleton((i) => AddGasStationController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, args) => const WelcomePage(),
    ),
    ChildRoute(
      '/home',
      child: (_, args) => const HomePage(),
    ),
    ChildRoute(
      '/my-maps',
      child: (_, args) => const MapsPage(),
    ),
    ChildRoute(
      '/add-map',
      child: (_, args) => AddMapPage(
        mapModel: args.data['mapModel'],
      ),
    ),
    ChildRoute(
      '/my-gas-stations',
      child: (_, args) => const GasStationsPage(),
    ),
    ChildRoute(
      '/add-gas-station',
      child: (_, args) => AddGasStationPage(
        gasStationModel: args.data['gasStationModel'],
      ),
    ),
    ChildRoute(
      '/result',
      child: (_, args) => ResultPage(
        result: args.data['result'],
      ),
    ),
  ];
}
