// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gas_stations_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GasStationsController on _GasStationsControllerBase, Store {
  late final _$gasStationsAtom =
      Atom(name: '_GasStationsControllerBase.gasStations', context: context);

  @override
  List<GasStationModel> get gasStations {
    _$gasStationsAtom.reportRead();
    return super.gasStations;
  }

  @override
  set gasStations(List<GasStationModel> value) {
    _$gasStationsAtom.reportWrite(value, super.gasStations, () {
      super.gasStations = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_GasStationsControllerBase.loading', context: context);

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

  late final _$loadAsyncAction =
      AsyncAction('_GasStationsControllerBase.load', context: context);

  @override
  Future load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_GasStationsControllerBase.delete', context: context);

  @override
  Future delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
gasStations: ${gasStations},
loading: ${loading}
    ''';
  }
}
