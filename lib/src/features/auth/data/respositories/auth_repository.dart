import 'package:i_gatchu/src/features/auth/data/models/auth_state.dart';
import 'package:i_gatchu/src/features/auth/data/services/AuthApiService.dart';
import 'package:i_gatchu/src/local_storage/LocalStorage.dart';
import 'package:i_gatchu/src/shared/models/token_pair.dart';

class AuthRepository {
  final AuthApiService _service;

  AuthRepository(this._service);


  Future<AuthResponse> authenticate(Map<String, dynamic> credentials) async {
    final response = await _service.authenticate(credentials);
    return response;
  }

  Future<AuthResponse> register(Map<String, dynamic> data) async {
    final response = await _service.register(data);
    return response;
  }

  Future<TokenPair?> getAuthToken() async {
    final token = await LocalStorage.getToken();
    return token;
  }

  Future<TokenPair> saveToken(TokenPair token) async {
    await LocalStorage.saveToken(token);
    return token;
  }

  Future<void> deleteToken() async {
    await LocalStorage.deleteToken();
  }

  Future<String> getUserId() async {
    return await LocalStorage.get("user");
  }



  Future<void> saveUserId(String userId) async {
    await LocalStorage.save("user", userId);
  }

  Future<void> deleteUserId() async {
    await LocalStorage.delete("user");
  }
}
