import '../models/notification/notification_model.dart';

abstract class NotificationRepo {
  Future<List<NotificationModel>>
  getNotifications();
}
