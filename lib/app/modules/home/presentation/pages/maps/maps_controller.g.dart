// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapsController on _MapsControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_MapsControllerBase.loading', context: context);

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

  late final _$mapsAtom =
      Atom(name: '_MapsControllerBase.maps', context: context);

  @override
  List<MapModel> get maps {
    _$mapsAtom.reportRead();
    return super.maps;
  }

  @override
  set maps(List<MapModel> value) {
    _$mapsAtom.reportWrite(value, super.maps, () {
      super.maps = value;
    });
  }

  late final _$loadAsyncAction =
      AsyncAction('_MapsControllerBase.load', context: context);

  @override
  Future load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_MapsControllerBase.delete', context: context);

  @override
  Future delete(int id) {
    return _$deleteAsyncAction.run(() => super.delete(id));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
maps: ${maps}
    ''';
  }
}
