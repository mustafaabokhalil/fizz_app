class NotificationResponse {
  final bool status;
  final String message;
  final NotificationData data;

  NotificationResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      status: json['status'],
      message: json['message'],
      data: NotificationData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class NotificationData {
  final List<Notification> notifications;
  final int unreadNotifications;

  NotificationData({
    required this.notifications,
    required this.unreadNotifications,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) {
    return NotificationData(
      notifications: (json['notifications'] as List)
          .map((item) => Notification.fromJson(item))
          .toList(),
      unreadNotifications: json['unreadNotifications'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'notifications':
          notifications.map((notification) => notification.toJson()).toList(),
      'unreadNotifications': unreadNotifications,
    };
  }
}

class Notification {
  final String message;
  final String title;
  final String image;
  final String createdAt;

  Notification({
    required this.message,
    required this.title,
    required this.image,
    required this.createdAt,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      message: json['message'],
      title: json['title'],
      image: json['Image'],
      createdAt: json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'title': title,
      'Image': image,
      'created_at': createdAt,
    };
  }
}
