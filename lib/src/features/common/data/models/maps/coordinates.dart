import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'coordinates.freezed.dart';
part 'coordinates.g.dart';

@Freezed()
class Coordinate with _$Coordinate {
  const factory Coordinate({
    required double lat,
    required double lng,
  }) = _Coordinate;

  factory Coordinate.fromJson(Map<String, dynamic> json)=> _$CoordinateFromJson(json);
}