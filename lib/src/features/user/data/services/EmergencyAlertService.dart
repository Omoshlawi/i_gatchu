import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
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
    var request = http.Request(
        'GET', Uri.parse('${Constants.BASE_URL}/emergency-alerts'));
    request.headers.addAll(headers);
    return await request.send();
  }

  Future<EmergencyAlert> addEmergencyAlert(Map<String, dynamic> value) async {
    final response = await call(addEmergencyAlert_, value);
    final responseString = await response.stream.bytesToString();
    final Map<String, dynamic> programData = json.decode(responseString);
    return EmergencyAlert.fromJson(programData);
  }

  Future<http.StreamedResponse> addEmergencyAlert_(
      Map<String, dynamic> value) async {
    final tokenPair = await getCachedToken();
    var headers = {'x-access-token': tokenPair.accessToken};
    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.BASE_URL}/emergency-alerts'));
    request.fields.addAll({
      'location[lat]': value["location"]["lat"].toString(),
      'location[lng]': value["location"]["lng"].toString(),
      'location[address]': value["location"]["address"],
      'description': value["description"],
      'supportServiceId': value['supportServiceId'],
      'title': value["title"]
    });
    final images = value["images"] as List<dynamic>;
    for (var i = 0; i < images.length; i++) {
      final memoryImage = await images[i].readAsBytes();
      debugPrint("$memoryImage");
      request.files.add(await http.MultipartFile.fromBytes(
          'images', memoryImage));
    }
    request.headers.addAll(headers);

    return await request.send();
  }
}
