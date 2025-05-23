import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/domain/entities/ticket.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/rating_bottom_sheet.dart';
import 'package:mynt/presentation/pages/tickets/cubit/tickets_cubit.dart';

class TicketDetailsScreen extends StatefulWidget {
  final Ticket ticket;
  const TicketDetailsScreen(this.ticket, {super.key});

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) => RatingBottomSheet(widget.ticket.id!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsCubit, TicketsState>(
      builder: (context, state) {
        var cubit = TicketsCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: AppColors.text1),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            title: Text(
              "Ticket Details",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppColors.text1,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStatusContainer(),
                        SizedBox(height: 10.h),
                        _buildInfoContainer(
                          "Ticket #${widget.ticket.id}",
                          [
                            _buildInfoRow("Title", widget.ticket.title ?? ''),
                            _buildInfoRow(
                                "Date", widget.ticket.creationDate ?? ''),
                            _buildInfoRow(
                                "Time", widget.ticket.creationTime ?? ''),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        _buildDescriptionContainer(),
                        SizedBox(height: 10.h),
                        _buildInfoContainer("Unit Details", [
                          _buildInfoRow(
                              "Title", widget.ticket.propertyTitle ?? ''),
                          _buildInfoRow(
                              "Number", widget.ticket.propertyNumber ?? ''),
                          _buildInfoRow(
                              "Building", widget.ticket.propertyBuilding ?? ''),
                        ]),
                        SizedBox(height: 10.h),
                        _buildResponsiblePersonSection(cubit),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      icon: const Icon(Icons.star, color: Colors.white),
                      label: Text(
                        "Rate",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () => showBottomSheet(context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildStatusContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: getStatusBackgroundColorById(widget.ticket.statusId ?? 0),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        getTicketStatusDescription(
            widget.ticket.statusId ?? 0, widget.ticket.statusText ?? ''),
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Montserrat",
          color: getStatusTextColorById(widget.ticket.statusId ?? 0),
        ),
      ),
    );
  }

  Widget _buildDescriptionContainer() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ticket Description",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: Colors.black,
            ),
          ),
          Divider(thickness: 1, color: Colors.grey[300]),
          Text(
            widget.ticket.description ?? '',
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "Montserrat",
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10.h),
          _buildImageRow(widget.ticket.gallery ?? []),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                fontFamily: "Montserrat",
                color: Colors.black54,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              value,
              maxLines: 2,
              textAlign: TextAlign.end,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(String title, List<Widget> children) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: AppColors.primary,
            ),
          ),
          Divider(thickness: 1, height: 20.h, color: Colors.grey[300]),
          ...children,
        ],
      ),
    );
  }

  Widget _buildImageRow(List<String> imageUrls) {
    return Row(
      children: imageUrls
          .map((url) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: CachedNetworkImage(
                  imageUrl: url,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(Icons.image, color: Colors.white),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(Icons.error, color: Colors.white),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildResponsiblePersonSection(TicketsCubit cubit) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Responsible Person",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundImage:
                    const AssetImage('assets/images/personImage.png'),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.ticket.customerName ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: const Color(0xFF262626),
                    ),
                  ),
                  Text(
                    widget.ticket.customerPhone ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Montserrat",
                      color: const Color(0xFF262626),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  icon: const Icon(Icons.call, color: Colors.white),
                  label: Text(
                    "Call",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    await callNumber(widget.ticket.customerPhone ?? '');
                  },
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  icon: const Icon(Icons.chat, color: Colors.white),
                  label: Text(
                    "Chat",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    await openWhatsAppChat(widget.ticket.customerPhone ?? '');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
