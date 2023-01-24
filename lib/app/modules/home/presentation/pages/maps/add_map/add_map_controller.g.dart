// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddMapController on _AddMapControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_AddMapControllerBase.isFormValid'))
          .value;

  late final _$formValidateAtom =
      Atom(name: '_AddMapControllerBase.formValidate', context: context);

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

  late final _$ethanolPercentErrorAtom =
      Atom(name: '_AddMapControllerBase.ethanolPercentError', context: context);

  @override
  String? get ethanolPercentError {
    _$ethanolPercentErrorAtom.reportRead();
    return super.ethanolPercentError;
  }

  @override
  set ethanolPercentError(String? value) {
    _$ethanolPercentErrorAtom.reportWrite(value, super.ethanolPercentError, () {
      super.ethanolPercentError = value;
    });
  }

  late final _$gasolinePercentErrorAtom = Atom(
      name: '_AddMapControllerBase.gasolinePercentError', context: context);

  @override
  String? get gasolinePercentError {
    _$gasolinePercentErrorAtom.reportRead();
    return super.gasolinePercentError;
  }

  @override
  set gasolinePercentError(String? value) {
    _$gasolinePercentErrorAtom.reportWrite(value, super.gasolinePercentError,
        () {
      super.gasolinePercentError = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_AddMapControllerBase.loading', context: context);

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
      AsyncAction('_AddMapControllerBase.save', context: context);

  @override
  Future save(MapModel mapModel) {
    return _$saveAsyncAction.run(() => super.save(mapModel));
  }

  late final _$_AddMapControllerBaseActionController =
      ActionController(name: '_AddMapControllerBase', context: context);

  @override
  dynamic resetFormValidate() {
    final _$actionInfo = _$_AddMapControllerBaseActionController.startAction(
        name: '_AddMapControllerBase.resetFormValidate');
    try {
      return super.resetFormValidate();
    } finally {
      _$_AddMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFormValidate(int index, bool value) {
    final _$actionInfo = _$_AddMapControllerBaseActionController.startAction(
        name: '_AddMapControllerBase.setFormValidate');
    try {
      return super.setFormValidate(index, value);
    } finally {
      _$_AddMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGasolinePercentError(String? value) {
    final _$actionInfo = _$_AddMapControllerBaseActionController.startAction(
        name: '_AddMapControllerBase.setGasolinePercentError');
    try {
      return super.setGasolinePercentError(value);
    } finally {
      _$_AddMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEthanolPercentError(String? value) {
    final _$actionInfo = _$_AddMapControllerBaseActionController.startAction(
        name: '_AddMapControllerBase.setEthanolPercentError');
    try {
      return super.setEthanolPercentError(value);
    } finally {
      _$_AddMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formValidate: ${formValidate},
ethanolPercentError: ${ethanolPercentError},
gasolinePercentError: ${gasolinePercentError},
loading: ${loading},
isFormValid: ${isFormValid}
    ''';
  }
}
