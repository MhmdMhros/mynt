import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/presentation/pages/tickets/ticket_widget.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample list of tickets
    final List<Map<String, String>> tickets = [
      {
        "ticketNum": "637893",
        "ticketSort": "Gate Pass",
        "date": "18/1/2025 3:45PM",
        "status": "Open",
      },
      {
        "ticketNum": "637893",
        "ticketSort": "Gate Pass",
        "date": "18/1/2025 3:45PM",
        "status": "Pending",
      },
      {
        "ticketNum": "637893",
        "ticketSort": "Gate Pass",
        "date": "18/1/2025 3:45PM",
        "status": "In Progress",
      },
      {
        "ticketNum": "637893",
        "ticketSort": "Gate Pass",
        "date": "18/1/2025 3:45PM",
        "status": "Rejected",
      },
      {
        "ticketNum": "637893",
        "ticketSort": "Gate Pass",
        "date": "18/1/2025 3:45PM",
        "status": "Canceled",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Tickets",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(22.w),
        child: ListView.builder(
          itemCount: tickets.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: TicketWidget(
                ticketNum: tickets[index]["ticketNum"]!,
                ticketSort: tickets[index]["ticketSort"]!,
                date: tickets[index]["date"]!,
                status: tickets[index]["status"]!,
              ),
            );
          },
        ),
      ),
    );
  }
}
