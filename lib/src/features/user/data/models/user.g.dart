// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      image: json['image'] as String?,
      username: json['username'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileUpdated: json['profileUpdated'] as bool? ?? true,
      accountVerified: json['accountVerified'] as bool? ?? true,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'name': instance.name,
      'gender': instance.gender,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'profileUpdated': instance.profileUpdated,
      'accountVerified': instance.accountVerified,
    };
