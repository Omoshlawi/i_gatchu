import 'package:freezed_annotation/freezed_annotation.dart';
part 'emergency_response.freezed.dart';
part 'emergency_response.g.dart';

@Freezed()
class EmergencyResponse with _$EmergencyResponse {
  const factory EmergencyResponse({
    String? id,
    @Default([]) List<String> images,
    String? description,
    required bool complete,
    required String responderName,
    required String createdAt,
    required String updatedAt,
  }) = _EmergencyResponse;

  factory EmergencyResponse.fromJson(Map<String, dynamic> json)=> _$EmergencyResponseFromJson(json);
}