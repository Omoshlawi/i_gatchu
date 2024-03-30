// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmergencyAlertImpl _$$EmergencyAlertImplFromJson(Map<String, dynamic> json) =>
    _$EmergencyAlertImpl(
      id: json['id'] as String?,
      title: json['title'] as String,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
      description: json['description'] as String?,
      supportService: json['supportService'] == null
          ? null
          : SupportService.fromJson(
              json['supportService'] as Map<String, dynamic>),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      responses: (json['responses'] as List<dynamic>?)
              ?.map(
                  (e) => EmergencyResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$EmergencyAlertImplToJson(
        _$EmergencyAlertImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'images': instance.images,
      'location': instance.location,
      'description': instance.description,
      'supportService': instance.supportService,
      'user': instance.user,
      'responses': instance.responses,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
