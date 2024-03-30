import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'program.freezed.dart';
part 'program.g.dart';

@Freezed()
class Program with _$Program {
  const factory Program({
    String? id,
    required String programCode,
    required String name,
    String? description,
    @Default(false) bool isActive,
    required String createdAt,
  }) = _Program;

  factory Program.fromJson(Map<String, dynamic> json)=> _$ProgramFromJson(json);
}