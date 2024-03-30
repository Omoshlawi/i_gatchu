// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProgramImpl _$$UserProgramImplFromJson(Map<String, dynamic> json) =>
    _$UserProgramImpl(
      id: json['id'] as String?,
      program: Program.fromJson(json['program'] as Map<String, dynamic>),
      isActive: json['isActive'] as bool? ?? false,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$UserProgramImplToJson(_$UserProgramImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'program': instance.program,
      'isActive': instance.isActive,
      'createdAt': instance.createdAt,
    };
