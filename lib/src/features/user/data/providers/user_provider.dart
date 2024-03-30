import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/user/data/models/user.dart';
import 'package:i_gatchu/src/features/user/data/respositories/UserRepository.dart';
import 'package:i_gatchu/src/features/user/data/services/UserService.dart';
import 'package:i_gatchu/src/features/user/presentation/controllers/UserControler.dart';

final userProvider = StateNotifierProvider<UserController, AsyncValue<User>>((ref) {
  final service = UserService();
  final repo = UserRepository(service);
  return UserController(repo);
});
