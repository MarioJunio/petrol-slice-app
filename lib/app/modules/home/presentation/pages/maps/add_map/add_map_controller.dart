import 'package:mobx/mobx.dart';
import 'package:petrol_slice/app/modules/home/domain/service/map_service.dart';
import 'package:petrol_slice/app/shared/models/map_model.dart';

part 'add_map_controller.g.dart';

class AddMapController = _AddMapControllerBase with _$AddMapController;

abstract class _AddMapControllerBase with Store {
  final MapService _mapService;

  @observable
  ObservableList<bool> formValidate = ObservableList<bool>.of(
    [false, false, false, false],
  );

  @observable
  String? ethanolPercentError;

  @observable
  String? gasolinePercentError;

  @observable
  bool loading = false;

  _AddMapControllerBase(this._mapService);

  @action
  resetFormValidate() {
    formValidate = ObservableList<bool>.of(
      [false, false, false, false],
    );
  }

  @action
  save(MapModel mapModel) async {
    try {
      loading = true;

      if (mapModel.id == null) {
        return await _mapService.create(mapModel);
      }

      return await _mapService.update(mapModel);
    } on Exception catch (e) {
      print(e);
    } finally {
      loading = false;
    }
  }

  @action
  setFormValidate(int index, bool value) => formValidate[index] = value;

  @action
  setGasolinePercentError(String? value) => gasolinePercentError = value;

  @action
  setEthanolPercentError(String? value) => ethanolPercentError = value;

  @computed
  bool get isFormValid {
    return formValidate.every((element) => element);
  }
}
