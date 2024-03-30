import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/auth/data/models/auth_state.dart';
import 'package:i_gatchu/src/features/auth/data/respositories/auth_repository.dart';
import 'package:i_gatchu/src/features/auth/data/services/AuthApiService.dart';
import 'package:i_gatchu/src/features/auth/presentation/controllers/auth_controller.dart';
import 'package:i_gatchu/src/features/user/data/respositories/UserRepository.dart';
import 'package:i_gatchu/src/features/user/data/services/UserService.dart';

final authStateProvider =
    StateNotifierProvider<AuthController, AsyncValue<AuthState>>((ref) {
  final authService = AuthApiService();
  final repository = AuthRepository(authService);
  final UserRepository useRepo = UserRepository(UserService());
  return AuthController(repository, useRepo);
});
