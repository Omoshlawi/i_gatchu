import 'dart:convert';

import 'package:i_gatchu/src/features/emmergency/data/models/support_services/support_service.dart';
import 'package:i_gatchu/src/shared/interfaces/HTTPService.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/constants.dart';

class SupportServicesService extends HTTPService {
  Future<List<SupportService>> getSupportServices() async {
    final response = await call(getSupportServices_, null);
    final responseString = await response.stream.bytesToString();
    final Map<String, dynamic> programData = json.decode(responseString);
    final programs = (programData["results"] as List<dynamic>)
        .map((e) => SupportService.fromJson(e))
        .toList();
    return programs;
  }

  Future<http.StreamedResponse> getSupportServices_(dynamic args) async {
    final tokenPair = await getCachedToken();
    var headers = {'x-access-token': tokenPair.accessToken};
    var request =
    http.Request('GET', Uri.parse('${Constants.BASE_URL}/services'));
    request.headers.addAll(headers);
    return await request.send();
  }
}