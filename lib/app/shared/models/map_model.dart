import 'dart:convert';

class MapModel {
  final int? id;
  final String? name;
  final String? description;
  final double? ethanol;
  final double? gasoline;

  MapModel({
    this.id,
    this.name,
    this.description,
    this.ethanol,
    this.gasoline,
  });

  MapModel copyWith({
    int? id,
    String? name,
    String? description,
    double? ethanol,
    double? gasoline,
  }) {
    return MapModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ethanol: ethanol ?? this.ethanol,
      gasoline: gasoline ?? this.gasoline,
    );
  }

  Map<String, dynamic> toDatabaseMap() {
    return {
      'name': name,
      'description': description,
      'ethanol': ethanol,
      'gasoline': gasoline,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'ethanol': ethanol,
      'gasoline': gasoline,
    };
  }

  factory MapModel.fromMap(Map<String, dynamic> map) {
    return MapModel(
      id: map['id']?.toInt(),
      name: map['name'],
      description: map['description'],
      ethanol: map['ethanol']?.toDouble(),
      gasoline: map['gasoline']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory MapModel.fromJson(String source) =>
      MapModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MapModel(id: $id, name: $name, description: $description, ethanol: $ethanol, gasoline: $gasoline)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MapModel &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.ethanol == ethanol &&
        other.gasoline == gasoline;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        ethanol.hashCode ^
        gasoline.hashCode;
  }
}
