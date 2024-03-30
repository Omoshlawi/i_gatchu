import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/emmergency/data/models/alerts/emergency_alert.dart';
import 'package:i_gatchu/src/features/emmergency/data/repositories/emergency_alert_repository.dart';

class EmergencyAlertController
    extends StateNotifier<AsyncValue<List<EmergencyAlert>>> {
  final EmergencyAlertRepository _repository;

  EmergencyAlertController(this._repository)
      : super(const AsyncValue.data([])) {
    getEmergencyAlerts();
  }

  Future<void> getEmergencyAlerts() async {
    state = const AsyncValue.loading();
    try {
      final alerts = await _repository.getEmergencyAlerts();
      state = AsyncValue.data(alerts);
    } catch (e) {
      state = const AsyncValue.data([]);
      rethrow;
    }
  }
}
