import 'package:flutter_modular/flutter_modular.dart';
import 'package:petrol_slice/app/shared/models/gas_station_model.dart';
import 'package:petrol_slice/app/shared/models/map_model.dart';
import 'package:petrol_slice/app/shared/models/result_model.dto.dart';

class HomeRouters {
  static goToWelcome() => Modular.to.navigate("/");

  static goToHome() => Modular.to.navigate('/home');

  static goToPreparationMaps() => Modular.to.pushNamed('/my-maps');

  static goToAddMap({MapModel? mapModel}) =>
      Modular.to.pushNamed('/add-map', arguments: {
        'mapModel': mapModel,
      });

  static goToGasStations() => Modular.to.pushNamed('/my-gas-stations');

  static goToAddGasStation({GasStationModel? gasStationModel}) =>
      Modular.to.pushNamed('/add-gas-station', arguments: {
        'gasStationModel': gasStationModel,
      });

  static goToResult({ResultDto? result}) =>
      Modular.to.pushNamed('/result', arguments: {
        'result': result,
      });
}
