import 'package:mobx/mobx.dart';
import 'package:petrol_slice/app/modules/home/domain/service/preferences_service.dart';
import 'package:petrol_slice/app/shared/models/gas_station_model.dart';
import 'package:petrol_slice/app/shared/models/map_model.dart';
import 'package:petrol_slice/app/shared/models/result_model.dto.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PreferenceService _preferenceService;

  @observable
  String? currentUsername = "";

  @observable
  MapModel? mapSelected;

  @observable
  GasStationModel? gasStationSelected;

  @observable
  double? fuelValue;

  _HomeControllerBase(this._preferenceService);

  @action
  setMapSelected(MapModel value) => mapSelected = value;

  @action
  setGasStationSelected(GasStationModel value) => gasStationSelected = value;

  @action
  setFuelValue(double value) => fuelValue = value;

  @action
  loadCurrentUser() async {
    currentUsername = await _preferenceService.getUsername();
  }

  @action
  calculate() async {
    final double ethanolCityValue =
        await _preferenceService.getUserEthanolCityConsumption() ?? 0;
    final double gasolineCityValue =
        await _preferenceService.getUserGasolineCityConsumption() ?? 0;

    final double ethanolHighway =
        await _preferenceService.getUserEthanolHighwayConsumption() ?? 0;
    final double gasolineHighway =
        await _preferenceService.getUserGasolineHighwayConsumption() ?? 0;

    final double totalGasolineLiter =
        (fuelValue! / gasStationSelected!.gasoline!) *
            (mapSelected!.gasoline! / 100);

    final double totalEthanolLiter =
        (fuelValue! / gasStationSelected!.ethanol!) *
            (mapSelected!.ethanol! / 100);

    final double totalGasolineValue =
        totalGasolineLiter * gasStationSelected!.gasoline!;

    final double totalEthanolValue = fuelValue! - totalGasolineValue;

    final double autonomy =
        (totalGasolineLiter * ((gasolineHighway + gasolineCityValue) / 2)) +
            (totalEthanolLiter * ((ethanolHighway + ethanolCityValue) / 2));

    return ResultDto(
      mapSelected!.name!,
      gasStationSelected!.name!,
      totalGasolineValue,
      totalEthanolValue,
      autonomy,
    );
  }

  @action
  signOut() async {
    return await _preferenceService.signOut();
  }
}
