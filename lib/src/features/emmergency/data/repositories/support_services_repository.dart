import 'package:i_gatchu/src/features/emmergency/data/models/support_services/support_service.dart';
import 'package:i_gatchu/src/features/emmergency/data/services/support_services_services.dart';

class SupportServicesRepository {
  final SupportServicesService _service;

  SupportServicesRepository(this._service);

  Future<List<SupportService>> getSupportServices() async {
    return await _service.getSupportServices();
  }
}