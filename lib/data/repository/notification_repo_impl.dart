import '../models/notification/notification_model.dart';

import 'notification_repo.dart';

class NotificationRepoImpl
    implements NotificationRepo {
  @override
  Future<List<NotificationModel>>
  getNotifications() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );

    return [];
  }
}
