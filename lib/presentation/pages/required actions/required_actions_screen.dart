import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/pages/maintenance%20service/maintenance_service_screen.dart';

class RequiredActionsScreen extends StatelessWidget {
  const RequiredActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> actions = [
      {
        "title": "Maintenance Service 🔧",
        "date": "15 Feb 2025",
        "description":
            "The unit requires maintenance on 15th February. The costs will be covered by the owner. Please confirm or reschedule"
      },
      {
        "title": "Maintenance Service 🔧",
        "date": "15 Feb 2025",
        "description":
            "The unit requires maintenance on 15th February. The costs will be covered by the owner. Please confirm or reschedule"
      },
      {
        "title": "Maintenance Service 🔧",
        "date": "15 Feb 2025",
        "description":
            "The unit requires maintenance on 15th February. The costs will be covered by the owner. Please confirm or reschedule"
      },
      {
        "title": "Maintenance Service 🔧",
        "date": "15 Feb 2025",
        "description":
            "The unit requires maintenance on 15th February. The costs will be covered by the owner. Please confirm or reschedule"
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
          "Required Actions",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: ListView.builder(
          itemCount: actions.length,
          itemBuilder: (context, index) {
            return _buildActionContainer(actions[index], context);
          },
        ),
      ),
    );
  }

  Widget _buildActionContainer(
      Map<String, String> action, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    action["title"]!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                      fontFamily: "Montserrat",
                    ),
                  ),
                  Text(
                    action["date"]!,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 12.sp,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MaintenanceServiceScreen(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        ); // Uses a smoother transition
                      },
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F525B),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 15.sp,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            action["description"]!,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black87,
              fontFamily: "Montserrat",
            ),
            maxLines: 2, // Limit to 2 lines
            overflow: TextOverflow.ellipsis, // Show "..." if text overflows
          ),
        ],
      ),
    );
  }
}
