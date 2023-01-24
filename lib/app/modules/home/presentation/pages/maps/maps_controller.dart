import 'package:mobx/mobx.dart';
import 'package:petrol_slice/app/modules/home/domain/service/map_service.dart';
import 'package:petrol_slice/app/shared/models/map_model.dart';

part 'maps_controller.g.dart';

class MapsController = _MapsControllerBase with _$MapsController;

abstract class _MapsControllerBase with Store {
  final MapService _mapService;

  @observable
  bool loading = false;

  @observable
  List<MapModel> maps = [];

  _MapsControllerBase(this._mapService);

  @action
  load() async {
    try {
      loading = true;
      maps = await _mapService.readAll();
    } finally {
      loading = false;
    }
  }

  @action
  delete(int id) async {
    try {
      loading = true;
      final int affectedRows = await _mapService.delete(id);

      if (affectedRows > 0) {
        await load();
      }
    } finally {
      loading = false;
    }
  }
}
