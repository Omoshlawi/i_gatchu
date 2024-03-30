import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/user/data/models/user.dart';
import 'package:i_gatchu/src/features/user/data/respositories/UserRepository.dart';

class UserController extends StateNotifier<AsyncValue<User>> {
  final UserRepository _repository;

  UserController(this._repository) : super(const AsyncValue.loading()) {
    getUser();
  }

  Future<void> getUser() async {
    state = const AsyncValue.loading();
    try {
      User user = await _repository.getUser();
      state = AsyncValue.data(user);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  Future<void> updateUser(User user) async {
    try {
      final user_ = await _repository.updateProfile(user);
      await getUser();
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verify(Map<String, dynamic> data) async {
    try {
      return await _repository.verifyAccount(data);
    } catch (e) {
      rethrow;
    }
  }
  Future<String> getOTPCode(String mode) async {
    try {
      return await _repository.getOTPCode(mode);
    } catch (e) {
      rethrow;
    }
  }
}
