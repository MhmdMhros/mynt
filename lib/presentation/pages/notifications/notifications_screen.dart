import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
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
            "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
        "name": "Reminder",
        "description": "Don't forget your appointment tomorrow at 10 AM.",
        "timeAgo": "Yesterday",
      },
      {
        "imageUrl":
            "https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg",
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
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
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
