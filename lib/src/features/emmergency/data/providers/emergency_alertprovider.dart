import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/emmergency/data/models/alerts/emergency_alert.dart';
import 'package:i_gatchu/src/features/emmergency/data/repositories/emergency_alert_repository.dart';
import 'package:i_gatchu/src/features/emmergency/presentations/controllers/emergency_alert_controller.dart';
import 'package:i_gatchu/src/features/user/data/services/EmergencyAlertService.dart';

final emergencyAlertProvider = StateNotifierProvider<EmergencyAlertController,
    AsyncValue<List<EmergencyAlert>>>((ref) {
  final repository = EmergencyAlertRepository(EmergencyAlertService());
  return EmergencyAlertController(repository);
});
