import 'package:mobx/mobx.dart';
import 'package:petrol_slice/app/modules/home/domain/service/gas_station_service.dart';
import 'package:petrol_slice/app/shared/models/gas_station_model.dart';

part 'gas_stations_controller.g.dart';

class GasStationsController = _GasStationsControllerBase
    with _$GasStationsController;

abstract class _GasStationsControllerBase with Store {
  final GasStationService _gasStationService;

  @observable
  List<GasStationModel> gasStations = [];

  @observable
  bool loading = false;

  _GasStationsControllerBase(this._gasStationService);

  @action
  load() async {
    try {
      loading = true;
      gasStations = await _gasStationService.readAll();
    } catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }

  @action
  delete(int id) async {
    try {
      loading = true;
      final int affectedRows = await _gasStationService.delete(id);

      if (affectedRows > 0) {
        load();
      }
    } catch (exception) {
      print(exception);
    } finally {
      loading = false;
    }
  }
}
