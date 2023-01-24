// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$currentUsernameAtom =
      Atom(name: '_HomeControllerBase.currentUsername', context: context);

  @override
  String? get currentUsername {
    _$currentUsernameAtom.reportRead();
    return super.currentUsername;
  }

  @override
  set currentUsername(String? value) {
    _$currentUsernameAtom.reportWrite(value, super.currentUsername, () {
      super.currentUsername = value;
    });
  }

  late final _$mapSelectedAtom =
      Atom(name: '_HomeControllerBase.mapSelected', context: context);

  @override
  MapModel? get mapSelected {
    _$mapSelectedAtom.reportRead();
    return super.mapSelected;
  }

  @override
  set mapSelected(MapModel? value) {
    _$mapSelectedAtom.reportWrite(value, super.mapSelected, () {
      super.mapSelected = value;
    });
  }

  late final _$gasStationSelectedAtom =
      Atom(name: '_HomeControllerBase.gasStationSelected', context: context);

  @override
  GasStationModel? get gasStationSelected {
    _$gasStationSelectedAtom.reportRead();
    return super.gasStationSelected;
  }

  @override
  set gasStationSelected(GasStationModel? value) {
    _$gasStationSelectedAtom.reportWrite(value, super.gasStationSelected, () {
      super.gasStationSelected = value;
    });
  }

  late final _$fuelValueAtom =
      Atom(name: '_HomeControllerBase.fuelValue', context: context);

  @override
  double? get fuelValue {
    _$fuelValueAtom.reportRead();
    return super.fuelValue;
  }

  @override
  set fuelValue(double? value) {
    _$fuelValueAtom.reportWrite(value, super.fuelValue, () {
      super.fuelValue = value;
    });
  }

  late final _$loadCurrentUserAsyncAction =
      AsyncAction('_HomeControllerBase.loadCurrentUser', context: context);

  @override
  Future loadCurrentUser() {
    return _$loadCurrentUserAsyncAction.run(() => super.loadCurrentUser());
  }

  late final _$calculateAsyncAction =
      AsyncAction('_HomeControllerBase.calculate', context: context);

  @override
  Future calculate() {
    return _$calculateAsyncAction.run(() => super.calculate());
  }

  late final _$signOutAsyncAction =
      AsyncAction('_HomeControllerBase.signOut', context: context);

  @override
  Future signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  late final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase', context: context);

  @override
  dynamic setMapSelected(MapModel value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setMapSelected');
    try {
      return super.setMapSelected(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGasStationSelected(GasStationModel value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setGasStationSelected');
    try {
      return super.setGasStationSelected(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFuelValue(double value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setFuelValue');
    try {
      return super.setFuelValue(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentUsername: ${currentUsername},
mapSelected: ${mapSelected},
gasStationSelected: ${gasStationSelected},
fuelValue: ${fuelValue}
    ''';
  }
}
