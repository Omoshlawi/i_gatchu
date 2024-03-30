// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmergencyResponseImpl _$$EmergencyResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EmergencyResponseImpl(
      id: json['id'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String?,
      complete: json['complete'] as bool,
      responderName: json['responderName'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$EmergencyResponseImplToJson(
        _$EmergencyResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'images': instance.images,
      'description': instance.description,
      'complete': instance.complete,
      'responderName': instance.responderName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
