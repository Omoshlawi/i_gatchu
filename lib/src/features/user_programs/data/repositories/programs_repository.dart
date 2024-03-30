import 'package:i_gatchu/src/features/user_programs/data/models/program.dart';
import 'package:i_gatchu/src/features/user_programs/data/models/user_program.dart';
import 'package:i_gatchu/src/features/user_programs/data/services/programs_service.dart';

import '../models/program_verification_detail.dart';


class ProgramsRepository {
  final ProgramService _service;

  ProgramsRepository(this._service);

  Future<List<Program>> getPrograms() async {
    return await _service.getPrograms();
  }

  Future<List<UserProgram>> getUserPrograms() async {
    return await _service.getUserPrograms();
  }

  Future<ProgramVerificationDetail> registerProgram(Map<String, dynamic> program)async{
    return await _service.registerProgram(program);
  }
  Future<String> verifyProgramOTP(Map<String, dynamic> data)async{
    return await _service.verifyProgramOTP(data);
  }

  Future<String> getVerificationCode(Map<String, dynamic> data) async{
    return await _service.requestVerificationCode(data);
  }
}
