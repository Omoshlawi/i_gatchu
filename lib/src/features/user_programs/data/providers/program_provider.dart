import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/user_programs/data/models/user_program.dart';
import 'package:i_gatchu/src/features/user_programs/data/repositories/programs_repository.dart';
import 'package:i_gatchu/src/features/user_programs/data/services/programs_service.dart';
import 'package:i_gatchu/src/features/user_programs/presentation/controllers/user_program_controller.dart';

final programProvider = StateNotifierProvider<UserProgramController, AsyncValue<List<UserProgram>>>((ref){
  final service = ProgramService();
  final repository = ProgramsRepository(service);
  return UserProgramController(repository);
});