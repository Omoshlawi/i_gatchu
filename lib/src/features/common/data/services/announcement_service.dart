import 'package:i_gatchu/src/features/common/data/models/announcement.dart';
import 'package:i_gatchu/src/shared/interfaces/HTTPService.dart';

class AnnouncementService extends HTTPService {
  final List<Announcement> _announcements = [
    const Announcement(
      id: "1",
      image: "https://images.unsplash.com/photo-1516567832553-66232148f74c?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      source: "https://images.unsplash.com/photo-1516567832553-66232148f74c?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      title: "Gas-ly Fire house accident",
      description:
          "Who doesn't love pizza? Join us for a pizza party on 28th November 2023 at the Juja Community Center. Enjoy unlimited slices of pizza from various toppings and flavors, along with drinks and desserts. Tickets are only 500 KES per person. Hurry, limited seats available!",
    ),
    const Announcement(
      id: "2",
      image: "https://images.unsplash.com/photo-1473889803946-6a3923603697?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      source: "https://images.unsplash.com/photo-1473889803946-6a3923603697?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      title: "Train accident in subway",
      description:
          "Get ready for a night of music and fun with our live music concert on 29th November 2023 at the Juja Stadium. Featuring some of the best local and international artists, this concert will make you dance and sing along. Tickets are on sale now, starting from 1000 KES. Don't miss this opportunity to see your favorite stars live!",
    ),
    const Announcement(
      id: "3",
      image: "https://images.unsplash.com/photo-1550831106-f8d5b6f1abe9?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      source: "https://images.unsplash.com/photo-1550831106-f8d5b6f1abe9?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      title: "Cholera Outbreak in nairobi",
      description: "Join us for a colorful celebration of flowers and nature on 25th November 2023 at the Juja Botanical Garden. Enjoy the beauty of various floral arrangements, live music, food stalls, and workshops. Admission is free for all ages.",
    ),
  ];

  Future<List<Announcement>> getAnnouncements() async {
    return _announcements;
  }
}
