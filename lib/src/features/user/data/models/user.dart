import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@Freezed()
class User with _$User {
  const factory User({
    required String? id,
    String? image,
    required String username,
    String? firstName,
    String? lastName,
    String? name,
    String? gender,
    required String email,
    required String phoneNumber,
    @Default(true) bool profileUpdated,
    @Default(true) bool accountVerified,

  }) = _User;

  factory User.fromJson(Map<String, dynamic> json)=> _$UserFromJson(json);
}