import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'program_verificaton_contact.freezed.dart';
part 'program_verificaton_contact.g.dart';

@Freezed()
class ProgramVerificationContact with _$ProgramVerificationContact {
  const factory ProgramVerificationContact({
    required String type,
    required String contact,
  }) = _ProgramVerificationContact;

  factory ProgramVerificationContact.fromJson(Map<String, dynamic> json)=> _$ProgramVerificationContactFromJson(json);
}

