import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/user_programs/data/models/user_program.dart';
import 'package:i_gatchu/src/features/user_programs/data/repositories/programs_repository.dart';

import '../../data/models/program_verification_detail.dart';

class UserProgramController
    extends StateNotifier<AsyncValue<List<UserProgram>>> {
  final ProgramsRepository _repository;

  UserProgramController(this._repository) : super(const AsyncValue.loading()) {
    _getUserPrograms();
  }

  Future<void> _getUserPrograms() async {
    try {
      final programs = await _repository
          .getUserPrograms();
      state = AsyncValue.data(programs);
    }catch(err){
      state = const AsyncValue.data([]);
    }
  }

  Future<ProgramVerificationDetail> registerProgram(
      Map<String, dynamic> data) async {
    try {
      return await _repository.registerProgram(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getVerificationCode(Map<String, dynamic> data) async {
    try {
      return await _repository.getVerificationCode(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> verifyProgramOTP(Map<String, dynamic> data) async {
    try {
      final message = await _repository.verifyProgramOTP(data);
      _getUserPrograms();
      return message;
    } catch (e) {
      rethrow;
    }
  }

// Future<void>
}
