import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'property.freezed.dart';
part 'property.g.dart';

@Freezed()
class Property with _$Property {
  const factory Property({
    String? country,
    String? countryCode,
    String? county,
    String? street,
    String? city,
    String? type,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json)=> _$PropertyFromJson(json);
}