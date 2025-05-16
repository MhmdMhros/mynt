// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/common/pagination/build_paged_list_view.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/domain/entities/notification.dart';
import 'package:mynt/presentation/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:mynt/presentation/pages/notifications/cubit/notifications_cubit.dart';
import 'package:mynt/presentation/pages/notifications/widgets/notification_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
      var cubit = NotificationsCubit.get(context);
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
          child: BuildPagedListView(
            pagingController: cubit.pagingController,
            fetchData: (page, limit) => cubit.getNotifications(page, limit),
            disposeController: false,
            buildItem: (item, index) {
              final notification = item as Notification_R;
              return NotificationWidget(
                imageUrl: notification.url!,
                name: notification.title ?? '',
                description: notification.description ?? '',
                timeAgo: notification.time ?? '',
                isRead: notification.readAt == null || notification.readAt == ''
                    ? false
                    : true,
                onRead: () async {
                  await cubit.readNtification(notification.id.toString());
                  DashboardCubit.get(context).decreamentCountOfNotifications();
                },
              );
            },
          ),
        ),
      );
    });
  }
}
