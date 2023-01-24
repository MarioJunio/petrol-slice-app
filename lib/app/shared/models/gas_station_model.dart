import 'dart:convert';

class GasStationModel {
  final int? id;
  final String? name;
  final double? ethanol;
  final double? gasoline;

  GasStationModel({
    this.id,
    this.name,
    this.ethanol,
    this.gasoline,
  });

  GasStationModel copyWith({
    int? id,
    String? name,
    double? ethanol,
    double? gasoline,
  }) {
    return GasStationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      ethanol: ethanol ?? this.ethanol,
      gasoline: gasoline ?? this.gasoline,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'ethanol': ethanol,
      'gasoline': gasoline,
    };
  }

  Map<String, dynamic> toDatabaseMap() {
    return {
      'name': name,
      'ethanol': ethanol,
      'gasoline': gasoline,
    };
  }

  factory GasStationModel.fromMap(Map<String, dynamic> map) {
    return GasStationModel(
      id: map['id']?.toInt(),
      name: map['name'],
      ethanol: map['ethanol']?.toDouble(),
      gasoline: map['gasoline']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory GasStationModel.fromJson(String source) =>
      GasStationModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GasStationModel(id: $id, name: $name, ethanol: $ethanol, gasoline: $gasoline)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GasStationModel &&
        other.id == id &&
        other.name == name &&
        other.ethanol == ethanol &&
        other.gasoline == gasoline;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ ethanol.hashCode ^ gasoline.hashCode;
  }
}
