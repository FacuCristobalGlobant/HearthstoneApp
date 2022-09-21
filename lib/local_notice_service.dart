import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNoticeService {
  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> setup() async {
    const androidSetting =
        AndroidInitializationSettings('@drawable/ic_launcher');

    const initSettings = InitializationSettings(
      android: androidSetting,
    );

    await _localNotificationsPlugin.initialize(initSettings).then((_) {
      debugPrint('setupPlugin: setup success');
    }).catchError((Object error) {
      debugPrint('Error: $error');
    });
  }

  Future<void> showNotification(
    int id,
    String title,
    String body,
  ) async {
    const androidDetail = AndroidNotificationDetails(
      'HearthstoneApp',
      'Favorites',
    );
    const noticeDetail = NotificationDetails(
      android: androidDetail,
    );
    await _localNotificationsPlugin.show(
      id,
      title,
      body,
      noticeDetail,
    );
  }
}
