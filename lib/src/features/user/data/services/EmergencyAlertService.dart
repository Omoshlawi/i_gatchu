import 'dart:convert';

import 'package:i_gatchu/src/features/emmergency/data/models/alerts/emergency_alert.dart';
import 'package:i_gatchu/src/shared/interfaces/HTTPService.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/constants.dart';

class EmergencyAlertService extends HTTPService {
  Future<List<EmergencyAlert>> getEmergencyAlerts() async {
    final response = await call(getEmergencyAlerts_, null);
    final responseString = await response.stream.bytesToString();
    final Map<String, dynamic> programData = json.decode(responseString);
    final programs = (programData["results"] as List<dynamic>)
        .map((e) => EmergencyAlert.fromJson(e))
        .toList();
    return programs;
  }

  Future<http.StreamedResponse> getEmergencyAlerts_(dynamic args) async {
    final tokenPair = await getCachedToken();
    var headers = {'x-access-token': tokenPair.accessToken};
    var request =
    http.Request('GET', Uri.parse('${Constants.BASE_URL}/emergency-alerts'));
    request.headers.addAll(headers);
    return await request.send();
  }
}