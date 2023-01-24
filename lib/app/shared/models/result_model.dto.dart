import 'dart:convert';

class ResultDto {
  final String mapName;
  final String gasStationName;
  final double gasolineTotalValue;
  final double ethanolTotalValue;
  final double autonomyTotalValue;

  ResultDto(
    this.mapName,
    this.gasStationName,
    this.gasolineTotalValue,
    this.ethanolTotalValue,
    this.autonomyTotalValue,
  );

  ResultDto copyWith({
    String? mapName,
    String? gasStationName,
    double? gasolineTotalValue,
    double? ethanolTotalValue,
    double? autonomyTotalValue,
  }) {
    return ResultDto(
      mapName ?? this.mapName,
      gasStationName ?? this.gasStationName,
      gasolineTotalValue ?? this.gasolineTotalValue,
      ethanolTotalValue ?? this.ethanolTotalValue,
      autonomyTotalValue ?? this.autonomyTotalValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'mapName': mapName,
      'gasStationName': gasStationName,
      'gasolineTotalValue': gasolineTotalValue,
      'ethanolTotalValue': ethanolTotalValue,
      'autonomyTotalValue': autonomyTotalValue,
    };
  }

  factory ResultDto.fromMap(Map<String, dynamic> map) {
    return ResultDto(
      map['mapName'] ?? '',
      map['gasStationName'] ?? '',
      map['gasolineTotalValue']?.toDouble() ?? 0.0,
      map['ethanolTotalValue']?.toDouble() ?? 0.0,
      map['autonomyTotalValue']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultDto.fromJson(String source) =>
      ResultDto.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResultDto(mapName: $mapName, gasStationName: $gasStationName, gasolineTotalValue: $gasolineTotalValue, ethanolTotalValue: $ethanolTotalValue, autonomyTotalValue: $autonomyTotalValue)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResultDto &&
        other.mapName == mapName &&
        other.gasStationName == gasStationName &&
        other.gasolineTotalValue == gasolineTotalValue &&
        other.ethanolTotalValue == ethanolTotalValue &&
        other.autonomyTotalValue == autonomyTotalValue;
  }

  @override
  int get hashCode {
    return mapName.hashCode ^
        gasStationName.hashCode ^
        gasolineTotalValue.hashCode ^
        ethanolTotalValue.hashCode ^
        autonomyTotalValue.hashCode;
  }
}
