import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mynt/core/constants/app_colors.dart';

class NotificationWidget extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String timeAgo;
  final VoidCallback onDelete;

  const NotificationWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.timeAgo,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cached Network Image for Notification
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 50,
                height: 50,
                color: Colors.grey[300], // Placeholder color
                child: const Center(
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: 50,
                height: 50,
                color: Colors.grey[300], // Background for error case
                child: const Icon(Icons.error, color: Colors.red),
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Notification Details & Delete Icon
          Expanded(
            child: Row(
              children: [
                // Notification Text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        timeAgo,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                // Delete Icon
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9EBEC),
                    borderRadius: BorderRadius.circular(
                        8), // Optional for rounded corners
                  ),
                  child: Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.delete_outline_rounded,
                        color: Colors.red,
                        size: 18,
                      ),
                      onPressed: onDelete,
                      padding: EdgeInsets.zero, // Ensures the icon is centered
                      constraints:
                          const BoxConstraints(), // Removes extra padding
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
