// emmergency_alert

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:i_gatchu/src/features/emmergency/data/models/location/location.dart';
import 'package:i_gatchu/src/features/emmergency/data/models/responses/emergency_response.dart';
import 'package:i_gatchu/src/features/emmergency/data/models/support_services/support_service.dart';
import 'package:i_gatchu/src/features/user/data/models/user.dart';
part 'emergency_alert.freezed.dart';
part 'emergency_alert.g.dart';

@Freezed()
class EmergencyAlert with _$EmergencyAlert {
  const factory EmergencyAlert({
    String? id,
    @Default([]) List<String> images,
    required Location location,
    String? description,
    SupportService? supportService,
    required User user,
    @Default([]) List<EmergencyResponse> responses,
    required String createdAt,
    required String updatedAt,
  }) = _EmergencyAlert;

  factory EmergencyAlert.fromJson(Map<String, dynamic> json)=> _$EmergencyAlertFromJson(json);
}