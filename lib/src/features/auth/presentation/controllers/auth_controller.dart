import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/auth/data/models/auth_state.dart';
import 'package:i_gatchu/src/features/auth/data/respositories/auth_repository.dart';
import 'package:i_gatchu/src/features/user/data/respositories/UserRepository.dart';
import 'package:i_gatchu/src/shared/models/token_pair.dart';

class AuthController extends StateNotifier<AsyncValue<AuthState>> {
  /// Act as the view model that hold the state of component or screen
  final AuthRepository _repository;
  final UserRepository _userRepository;

  AuthController(this._repository, this._userRepository) : super(const AsyncValue.loading()) {
    loadAuthState();
  }

  Future<void> loadAuthState() async {
    try {
      final user = await _userRepository.getUser();
      state = AsyncValue.data(AuthState(
        isAccountVerified: user.accountVerified,
        isProfileComplete: user.profileUpdated,
        isAuthenticated: true,
      ));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> login(Map<String, dynamic> credentials) async {
    try {
      final authResponse = await _repository.authenticate(credentials);
      await _repository.saveToken(TokenPair(
        accessToken: authResponse.accessToken,
        refreshToken: authResponse.refreshToken,
      ));
      state = AsyncValue.data(
        AuthState(
          isAccountVerified: authResponse.accountVerified,
          isProfileComplete: authResponse.profileUpdated,
          isAuthenticated: authResponse.accessToken.isNotEmpty,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(Map<String, dynamic> data) async {
    try {
      final authResponse = await _repository.register(data);
      await _repository.saveToken(TokenPair(
        accessToken: authResponse.accessToken,
        refreshToken: authResponse.refreshToken,
      ));
      state = AsyncValue.data(AuthState(
        isAccountVerified: authResponse.accountVerified,
        isProfileComplete: authResponse.profileUpdated,
        isAuthenticated: authResponse.accessToken.isNotEmpty,
      ));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> markProfileAsUpdated() async {
    state.when(
      data: (value) => state = AsyncValue.data(
        value.copyWith(
          isProfileComplete: true,
        ),
      ),
      error: (error, stackTrace) => state = AsyncValue.error(error, stackTrace),
      loading: () => state = const AsyncValue.loading(),
    );
  }

  Future<void> markProfileAsAccountVerified() async {
    state.when(
      data: (value) => state = AsyncValue.data(
        value.copyWith(
          isAccountVerified: true,
        ),
      ),
      error: (error, stackTrace) => state = AsyncValue.error(error, stackTrace),
      loading: () => state = const AsyncValue.loading(),
    );
  }

  Future<void> logout() async {
    _repository.deleteToken();
    state.when(
      data: (value) => state = AsyncValue.data(
        value.copyWith(
          isAuthenticated: false,
        ),
      ),
      error: (error, stackTrace) => state = AsyncValue.error(error, stackTrace),
      loading: () => state = const AsyncValue.loading(),
    );
  }
}
