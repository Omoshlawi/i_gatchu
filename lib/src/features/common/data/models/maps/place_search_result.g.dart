// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaceSearchResultImpl _$$PlaceSearchResultImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaceSearchResultImpl(
      display: json['display'] as String,
      coordinates:
          Coordinate.fromJson(json['coordinates'] as Map<String, dynamic>),
      properties: Property.fromJson(json['properties'] as Map<String, dynamic>),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$PlaceSearchResultImplToJson(
        _$PlaceSearchResultImpl instance) =>
    <String, dynamic>{
      'display': instance.display,
      'coordinates': instance.coordinates,
      'properties': instance.properties,
      'name': instance.name,
    };
