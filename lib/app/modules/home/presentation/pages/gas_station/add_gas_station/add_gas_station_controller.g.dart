// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_gas_station_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddGasStationController on _AddGasStationControllerBase, Store {
  Computed<bool>? _$isFormValidateComputed;

  @override
  bool get isFormValidate =>
      (_$isFormValidateComputed ??= Computed<bool>(() => super.isFormValidate,
              name: '_AddGasStationControllerBase.isFormValidate'))
          .value;

  late final _$formValidateAtom =
      Atom(name: '_AddGasStationControllerBase.formValidate', context: context);

  @override
  ObservableList<bool> get formValidate {
    _$formValidateAtom.reportRead();
    return super.formValidate;
  }

  @override
  set formValidate(ObservableList<bool> value) {
    _$formValidateAtom.reportWrite(value, super.formValidate, () {
      super.formValidate = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_AddGasStationControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('_AddGasStationControllerBase.save', context: context);

  @override
  Future save(GasStationModel gasStation) {
    return _$saveAsyncAction.run(() => super.save(gasStation));
  }

  late final _$_AddGasStationControllerBaseActionController =
      ActionController(name: '_AddGasStationControllerBase', context: context);

  @override
  void resetFormValidate() {
    final _$actionInfo = _$_AddGasStationControllerBaseActionController
        .startAction(name: '_AddGasStationControllerBase.resetFormValidate');
    try {
      return super.resetFormValidate();
    } finally {
      _$_AddGasStationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFormValidate(int index, bool value) {
    final _$actionInfo = _$_AddGasStationControllerBaseActionController
        .startAction(name: '_AddGasStationControllerBase.setFormValidate');
    try {
      return super.setFormValidate(index, value);
    } finally {
      _$_AddGasStationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formValidate: ${formValidate},
loading: ${loading},
isFormValidate: ${isFormValidate}
    ''';
  }
}
