import 'package:mobx/mobx.dart';
import 'package:petrol_slice/app/modules/home/domain/service/preferences_service.dart';

part 'welcome_controller.g.dart';

class WelcomeController = _WelcomeControllerBase with _$WelcomeController;

abstract class _WelcomeControllerBase with Store {
  final PreferenceService _preferenceService;

  @observable
  String name = "";

  @observable
  double gasolineCityConsumption = 0;

  @observable
  double gasolineHighwayConsumption = 0;

  @observable
  double ethanolCityConsumption = 0;

  @observable
  double ethanolHighwayConsumption = 0;

  _WelcomeControllerBase(this._preferenceService);

  @action
  void setName(value) => name = value;

  @action
  void setGasolineCityConsumption(value) => gasolineCityConsumption = value;

  @action
  void setGasolineHighwayConsumption(value) =>
      gasolineHighwayConsumption = value;

  @action
  void setEthanolCityConsumption(value) => ethanolCityConsumption = value;

  @action
  void setEthanolHighwayConsumption(value) => ethanolHighwayConsumption = value;

  @action
  save() async {
    _preferenceService.setUsername(name);
    _preferenceService.setUserGasolineCityConsumption(gasolineCityConsumption);
    _preferenceService
        .setUserGasolineHighwayConsumption(gasolineHighwayConsumption);
    _preferenceService.setUserEthanolCityConsumption(ethanolCityConsumption);
    _preferenceService
        .setUserEthanolHighwayConsumption(ethanolHighwayConsumption);
  }

  @action
  load() async {
    name = await _preferenceService.getUsername() ?? "";
    gasolineCityConsumption =
        await _preferenceService.getUserGasolineCityConsumption() ?? 0;
    gasolineHighwayConsumption =
        await _preferenceService.getUserGasolineHighwayConsumption() ?? 0;
    ethanolCityConsumption =
        await _preferenceService.getUserEthanolCityConsumption() ?? 0;
    ethanolHighwayConsumption =
        await _preferenceService.getUserEthanolHighwayConsumption() ?? 0;
  }

  @computed
  bool get isFormValid =>
      name.isNotEmpty &&
      gasolineCityConsumption > 0 &&
      gasolineHighwayConsumption > 0 &&
      ethanolCityConsumption > 0 &&
      ethanolHighwayConsumption > 0;
}
