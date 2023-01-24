import 'package:mobx/mobx.dart';
import 'package:petrol_slice/app/modules/home/domain/service/gas_station_service.dart';
import 'package:petrol_slice/app/shared/models/gas_station_model.dart';

part 'add_gas_station_controller.g.dart';

class AddGasStationController = _AddGasStationControllerBase
    with _$AddGasStationController;

abstract class _AddGasStationControllerBase with Store {
  final GasStationService _gasStationService;

  @observable
  ObservableList<bool> formValidate = ObservableList.of([false, false, false]);

  @observable
  bool loading = false;

  _AddGasStationControllerBase(this._gasStationService);
  
  @action
  void resetFormValidate() {
    formValidate = ObservableList.of([false, false, false]);
  }

  @action
  save(GasStationModel gasStation) async {
    try {
      loading = true;

      if (gasStation.id == null) {
        return await _gasStationService.create(gasStation);
      }

      return await _gasStationService.update(gasStation);
    } catch (exception) {
      print(exception);
    } finally {
      loading = false;
    }
  }

  @action
  void setFormValidate(int index, bool value) => formValidate[index] = value;

  @computed
  bool get isFormValidate => formValidate.every((element) => element);
}
