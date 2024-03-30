import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'support_service.freezed.dart';
part 'support_service.g.dart';

@Freezed()
class SupportService with _$SupportService {
  const factory SupportService({
    String? id,
    required String image,
    required String name,
    required String phoneNumber,
    required String email,
    required String createdAt,
    required String updatedAt,
  }) = _SupportService;

  factory SupportService.fromJson(Map<String, dynamic> json)=> _$SupportServiceFromJson(json);
}