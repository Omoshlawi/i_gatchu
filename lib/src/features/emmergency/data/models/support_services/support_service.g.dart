// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SupportServiceImpl _$$SupportServiceImplFromJson(Map<String, dynamic> json) =>
    _$SupportServiceImpl(
      id: json['id'] as String?,
      image: json['image'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$SupportServiceImplToJson(
        _$SupportServiceImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
