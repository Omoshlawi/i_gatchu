import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:i_gatchu/src/features/common/data/models/maps/coordinates.dart';
import 'package:i_gatchu/src/features/common/data/models/maps/property.dart';
part 'place_search_result.freezed.dart';
part 'place_search_result.g.dart';

@Freezed()
class PlaceSearchResult with _$PlaceSearchResult {
  const factory PlaceSearchResult({
    required String display,
    required Coordinate coordinates,
    required Property properties,
    String? name,
  }) = _PlaceSearchResult;

  factory PlaceSearchResult.fromJson(Map<String, dynamic> json)=> _$PlaceSearchResultFromJson(json);
}