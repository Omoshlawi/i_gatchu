import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:i_gatchu/src/features/auth/data/models/auth_state.dart';
import 'package:i_gatchu/src/shared/interfaces/HTTPService.dart';
import 'package:i_gatchu/src/utils/constants.dart';

class AuthApiService extends HTTPService {

  Future<AuthResponse> authenticate(Map<String, dynamic> credentials) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('${Constants.BASE_URL}/users/login'));
    request.body = json.encode(credentials);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseString = await response.stream.bytesToString();
      final data = jsonDecode(responseString);
      final authState = AuthResponse(
        accessToken: response.headers["x-access-token"]!,
        refreshToken: response.headers["x-access-token"]!,
        accountVerified: true,
        profileUpdated: true,
      );
      return authState;
    } else {
      throw await getException(response);
    }
  }

  Future<AuthResponse> register(Map<String, dynamic> data) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('${Constants.BASE_URL}/users/register'));
    request.body = json.encode(data);
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      final responseString = await response.stream.bytesToString();
      final data = jsonDecode(responseString);
      final authState = AuthResponse(
        accessToken: response.headers["x-access-token"]!,
        refreshToken: response.headers["x-access-token"]!,
        accountVerified: true,
        profileUpdated: true,
      );
      return authState;
    } else {
      throw await getException(response);
    }
  }

  // Future<http.StreamedResponse> signInWithGoogle_() async {
  //   var request =
  //   http.Request('GET', Uri.parse('${Constants.BASE_URL}/auth/google'));
  //   return await request.send();
  // }
  // Future<User> signInWithGoogle() async {
  //
  // }
}
