import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/domain/entities/ticket.dart';
import 'package:mynt/presentation/pages/ticket%20details/ticket_details_screen.dart';

class TicketWidget extends StatelessWidget {
  final Ticket ticket;

  const TicketWidget({
    super.key,
    required this.ticket,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                TicketDetailsScreen(ticket),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "Ticket Title: ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ticket.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${ticket.creationDate ?? ''} ${ticket.creationTime ?? ''}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Ticket Num: ",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black87,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      Text(
                        '#${ticket.id.toString()}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: _getStatusBackgroundColor(ticket.statusText ?? ''),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      ticket.statusText ?? '',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: _getStatusTextColor(ticket.statusText ?? ''),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper functions to get colors based on status
  Color _getStatusBackgroundColor(String status) {
    switch (status) {
      case "OPEN":
        return const Color(0xFFE9F9FB);
      case "PENDING":
        return const Color(0xFFFFF8E5);
      case "IN PROGRESS":
        return const Color(0xFFEDF8EE);
      case "CANCELED":
        return const Color(0xFFF0F0F0);
      case "REJECTED":
        return const Color(0xFFFFE8E5);
      default:
        return Colors.grey[200]!; // Default background color
    }
  }

  Color _getStatusTextColor(String status) {
    switch (status) {
      case "OPEN":
        return AppColors.primary;
      case "PENDING":
        return const Color(0xFFCC9D00);
      case "IN PROGRESS":
        return const Color(0xFF328039);
      case "CANCELED":
        return const Color(0xFF666666);
      case "REJECTED":
        return const Color(0xFFBF4C43);
      default:
        return Colors.black; // Default text color
    }
  }
}
