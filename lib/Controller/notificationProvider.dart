// ignore_for_file: file_names

import 'package:flutter/material.dart';

class NotificationProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _notifications = [];

  List<Map<String, dynamic>> get notifications => _notifications;

  void addNotification(String notification, Map<String, dynamic> data) {
    _notifications.insert(0, {'notification': notification, 'data': data});
    notifyListeners();
  }

  void clearNotifications() {
    _notifications.clear();
    notifyListeners();
  }
}
