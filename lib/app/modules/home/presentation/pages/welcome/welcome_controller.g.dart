// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'welcome_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WelcomeController on _WelcomeControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_WelcomeControllerBase.isFormValid'))
          .value;

  late final _$nameAtom =
      Atom(name: '_WelcomeControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$gasolineCityConsumptionAtom = Atom(
      name: '_WelcomeControllerBase.gasolineCityConsumption', context: context);

  @override
  double get gasolineCityConsumption {
    _$gasolineCityConsumptionAtom.reportRead();
    return super.gasolineCityConsumption;
  }

  @override
  set gasolineCityConsumption(double value) {
    _$gasolineCityConsumptionAtom
        .reportWrite(value, super.gasolineCityConsumption, () {
      super.gasolineCityConsumption = value;
    });
  }

  late final _$gasolineHighwayConsumptionAtom = Atom(
      name: '_WelcomeControllerBase.gasolineHighwayConsumption',
      context: context);

  @override
  double get gasolineHighwayConsumption {
    _$gasolineHighwayConsumptionAtom.reportRead();
    return super.gasolineHighwayConsumption;
  }

  @override
  set gasolineHighwayConsumption(double value) {
    _$gasolineHighwayConsumptionAtom
        .reportWrite(value, super.gasolineHighwayConsumption, () {
      super.gasolineHighwayConsumption = value;
    });
  }

  late final _$ethanolCityConsumptionAtom = Atom(
      name: '_WelcomeControllerBase.ethanolCityConsumption', context: context);

  @override
  double get ethanolCityConsumption {
    _$ethanolCityConsumptionAtom.reportRead();
    return super.ethanolCityConsumption;
  }

  @override
  set ethanolCityConsumption(double value) {
    _$ethanolCityConsumptionAtom
        .reportWrite(value, super.ethanolCityConsumption, () {
      super.ethanolCityConsumption = value;
    });
  }

  late final _$ethanolHighwayConsumptionAtom = Atom(
      name: '_WelcomeControllerBase.ethanolHighwayConsumption',
      context: context);

  @override
  double get ethanolHighwayConsumption {
    _$ethanolHighwayConsumptionAtom.reportRead();
    return super.ethanolHighwayConsumption;
  }

  @override
  set ethanolHighwayConsumption(double value) {
    _$ethanolHighwayConsumptionAtom
        .reportWrite(value, super.ethanolHighwayConsumption, () {
      super.ethanolHighwayConsumption = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('_WelcomeControllerBase.save', context: context);

  @override
  Future save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$loadAsyncAction =
      AsyncAction('_WelcomeControllerBase.load', context: context);

  @override
  Future load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$_WelcomeControllerBaseActionController =
      ActionController(name: '_WelcomeControllerBase', context: context);

  @override
  void setName(dynamic value) {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGasolineCityConsumption(dynamic value) {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.setGasolineCityConsumption');
    try {
      return super.setGasolineCityConsumption(value);
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setGasolineHighwayConsumption(dynamic value) {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.setGasolineHighwayConsumption');
    try {
      return super.setGasolineHighwayConsumption(value);
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEthanolCityConsumption(dynamic value) {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.setEthanolCityConsumption');
    try {
      return super.setEthanolCityConsumption(value);
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEthanolHighwayConsumption(dynamic value) {
    final _$actionInfo = _$_WelcomeControllerBaseActionController.startAction(
        name: '_WelcomeControllerBase.setEthanolHighwayConsumption');
    try {
      return super.setEthanolHighwayConsumption(value);
    } finally {
      _$_WelcomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
gasolineCityConsumption: ${gasolineCityConsumption},
gasolineHighwayConsumption: ${gasolineHighwayConsumption},
ethanolCityConsumption: ${ethanolCityConsumption},
ethanolHighwayConsumption: ${ethanolHighwayConsumption},
isFormValid: ${isFormValid}
    ''';
  }
}
