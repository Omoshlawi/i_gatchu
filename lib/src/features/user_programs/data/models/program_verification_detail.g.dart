// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_verification_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgramVerificationDetailImpl _$$ProgramVerificationDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$ProgramVerificationDetailImpl(
      programCode: json['programCode'] as String,
      message: json['message'] as String,
      contacts: (json['contacts'] as List<dynamic>?)
              ?.map((e) => ProgramVerificationContact.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ProgramVerificationDetailImplToJson(
        _$ProgramVerificationDetailImpl instance) =>
    <String, dynamic>{
      'programCode': instance.programCode,
      'message': instance.message,
      'contacts': instance.contacts,
    };
