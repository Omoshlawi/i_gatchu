import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'location.freezed.dart';
part 'location.g.dart';

@Freezed()
class Location with _$Location {
  const factory Location({
    required double lat,
    required double lng,
    required String address,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json)=> _$LocationFromJson(json);
}