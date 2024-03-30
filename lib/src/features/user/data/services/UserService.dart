import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:i_gatchu/src/features/user/data/models/user.dart';
import 'package:i_gatchu/src/shared/interfaces/HTTPService.dart';
import 'package:i_gatchu/src/utils/constants.dart';

class UserService extends HTTPService {
  Future<http.StreamedResponse> updateProfile_(User user) async {
    final tokenPair = await getCachedToken();
    var headers = {
      'x-access-token': tokenPair.accessToken,
      'Content-Type': 'application/json'
    };
    var request =
        http.Request('PUT', Uri.parse('${Constants.BASE_URL}/users/profile'));
    // Serialize user data to JSON
    final userData = user.toJson();
    // Add headers to the request
    request.headers.addAll(headers);
    // Add DATA TO REQUEST
    request.body = json.encode(userData);
    // Send the request and get the response
    http.StreamedResponse response = await request.send();
    return response;
  }

  Future<User> updateProfile(User user) async {
    // Send the request and get the response
    http.StreamedResponse response = await call<User>(updateProfile_, user);
    // Check the response status code
    return user;
  }

  Future<User> getUser() async {
    final response = await call(getUser_, null);
    final responseString = await response.stream.bytesToString();
    final userData = json.decode(responseString);
    return User.fromJson({...userData});
  }

  Future<http.StreamedResponse> getUser_(dynamic args) async {
    final tokenPair = await getCachedToken();
    var headers = {'x-access-token': tokenPair.accessToken};
    var request =
        http.Request('GET', Uri.parse('${Constants.BASE_URL}/users/profile'));
    request.headers.addAll(headers);
    return await request.send();
  }

  Future<Uint8List> _downloadRemoteImage(String remoteImagePath) async {
    final response = await http.get(Uri.parse(remoteImagePath));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download remote image');
    }
  }

  Future<String> accountVerify(Map<String, dynamic> data) async {
    http.StreamedResponse response = await call(accountVerify_, data);

    final responseString = await response.stream.bytesToString();
    final userData = json.decode(responseString);
    return userData["detail"];
  }

  Future<http.StreamedResponse> accountVerify_(
      Map<String, dynamic> data) async {
    final tokenPair = await getCachedToken();
    var headers = {
      'x-access-token': tokenPair.accessToken,
      'Content-Type': 'application/json',
    };
    var request =
        http.Request('POST', Uri.parse('${Constants.BASE_URL}/auth/verify'));
    request.body = jsonEncode(data);
    request.headers.addAll(headers);
    return await request.send();
  }

  Future<String> _requestVerificationCode(String? mode) async {
    final tokenPair = await getCachedToken();
    var headers = {
      'x-access-token': tokenPair.accessToken,
      'Content-Type': 'application/json'
    };
    var request = http.Request(
        'GET', Uri.parse('${Constants.BASE_URL}/auth/verify?mode=$mode'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final userData = json.decode(responseString);
      return userData["detail"];
    } else {
      throw await getException(response);
    }
  }

  Future<http.StreamedResponse> requestVerificationCode_(String? mode) async {
    final tokenPair = await getCachedToken();
    var headers = {'x-access-token': tokenPair.accessToken};
    var request = http.Request(
        'GET', Uri.parse('${Constants.BASE_URL}/auth/verify?mode=$mode'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    return response;
  }

  Future<String> requestVerificationCode(String? mode) async {
    http.StreamedResponse response =
        await call<String?>(requestVerificationCode_, mode);

    final responseString = await response.stream.bytesToString();
    final userData = json.decode(responseString);
    return userData["detail"];
  }
}
