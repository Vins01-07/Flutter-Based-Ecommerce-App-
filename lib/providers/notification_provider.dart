import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String description;
  final String time;
  final IconData icon;
  final Color color;

  NotificationModel({
    required this.title,
    required this.description,
    required this.time,
    required this.icon,
    required this.color,
  });
}

class NotificationProvider extends ChangeNotifier {
  final List<NotificationModel> _notifications = [
    NotificationModel(
      title: "Flash Sale Alert! ⚡",
      description: "Get up to 70% off on all electronic items for the next 2 hours only!",
      time: "2 mins ago",
      icon: Icons.flash_on,
      color: Colors.orange,
    ),
    NotificationModel(
      title: "New Collection Arrived ✨",
      description: "Check out the new summer collection specially curated for you.",
      time: "5 hours ago",
      icon: Icons.new_releases,
      color: Colors.purple,
    ),
  ];

  List<NotificationModel> get notifications => _notifications;

  void addNotification(NotificationModel notification) {
    _notifications.insert(0, notification);
    notifyListeners();
  }
}
