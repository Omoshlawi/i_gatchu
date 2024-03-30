import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_gatchu/src/features/common/data/models/announcement.dart';
import 'package:i_gatchu/src/features/common/data/repositories/announceent_repository.dart';
import 'package:i_gatchu/src/features/common/data/services/announcement_service.dart';

final announcementsProvider = FutureProvider<List<Announcement>>((ref) async {
  final service = AnnouncementService();
  final repo = AnnouncementRepository(service);
  return await repo.getAnnouncements();
});
