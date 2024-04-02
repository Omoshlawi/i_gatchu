import 'package:flutter/material.dart';
import 'package:i_gatchu/src/features/user/data/services/EmergencyAlertService.dart';

import '../models/alerts/emergency_alert.dart';

class EmergencyAlertRepository {
  final EmergencyAlertService _service;

  EmergencyAlertRepository(this._service);

  Future<List<EmergencyAlert>> getEmergencyAlerts() async {
    return await _service.getEmergencyAlerts();
  }

  Future<EmergencyAlert> addEmergencyAlert(Map<String, dynamic> value) async{
    return await _service.addEmergencyAlert(value);
  }
}