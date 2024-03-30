import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/emmergency/data/models/support_services/support_service.dart';
import 'package:i_gatchu/src/features/emmergency/data/repositories/support_services_repository.dart';
import 'package:i_gatchu/src/features/emmergency/data/services/support_services_services.dart';

final supportServiceProvider = FutureProvider<List<SupportService>>((ref) async {
  final repo = SupportServicesRepository(SupportServicesService());
  return await repo.getSupportServices();
});