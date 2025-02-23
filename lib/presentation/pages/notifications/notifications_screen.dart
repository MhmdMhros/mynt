import 'package:flutter/material.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'notification_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> notifications = [
      {
        "imageUrl":
            "https://res.cloudinary.com/ddzepnwgb/image/upload/v1733960587/userImage1.png",
        "name": "New Message",
        "description": "You have received a new message from John.",
        "timeAgo": "5 mins ago",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/ddzepnwgb/image/upload/v1733960587/userImage1.png",
        "name": "Order Update",
        "description": "Your order #1234 has been shipped.",
        "timeAgo": "1 hour ago",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/ddzepnwgb/image/upload/v1733960587/userImage1.png",
        "name": "Reminder",
        "description": "Don't forget your appointment tomorrow at 10 AM.",
        "timeAgo": "Yesterday",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/ddzepnwgb/image/upload/v1733960587/userImage1.png",
        "name": "Reminder",
        "description": "Don't forget your appointment tomorrow at 10 AM.",
        "timeAgo": "Yesterday",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/ddzepnwgb/image/upload/v1733960587/userImage1.png",
        "name": "Reminder",
        "description": "Don't forget your appointment tomorrow at 10 AM.",
        "timeAgo": "Yesterday",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/ddzepnwgb/image/upload/v1733960587/userImage1.png",
        "name": "Reminder",
        "description": "Don't forget your appointment tomorrow at 10 AM.",
        "timeAgo": "Yesterday",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/ddzepnwgb/image/upload/v1733960587/userImage1.png",
        "name": "Reminder",
        "description": "Don't forget your appointment tomorrow at 10 AM.",
        "timeAgo": "Yesterday",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/ddzepnwgb/image/upload/v1733960587/userImage1.png",
        "name": "Reminder",
        "description": "Don't forget your appointment tomorrow at 10 AM.",
        "timeAgo": "Yesterday",
      },
      {
        "imageUrl":
            "https://res.cloudinary.com/ddzepnwgb/image/upload/v1733960587/userImage1.png",
        "name": "Reminder",
        "description": "Don't forget your appointment tomorrow at 10 AM.",
        "timeAgo": "Yesterday",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.text1),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: const Text(
          "Notifications",
          style: TextStyle(color: AppColors.text1, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            final item = notifications[index];
            return NotificationWidget(
              imageUrl: item["imageUrl"]!,
              name: item["name"]!,
              description: item["description"]!,
              timeAgo: item["timeAgo"]!,
              onDelete: () {
                setState(() {
                  notifications.removeAt(index);
                });
              },
            );
          },
        ),
      ),
    );
  }
}
