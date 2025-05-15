import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/common/pagination/build_paged_list_view.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/domain/entities/ticket.dart';
import 'package:mynt/presentation/pages/tickets/cubit/tickets_cubit.dart';
import 'package:mynt/presentation/pages/tickets/widgets/ticket_widget.dart';

class TicketsScreen extends StatelessWidget {
  const TicketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsCubit, TicketsState>(builder: (context, state) {
      var cubit = TicketsCubit.get(context);
      return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const Text(""),
          title: Text(
            "Tickets",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              fontSize: 16.sp,
              color: AppColors.text1,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(22.w),
          child: BuildPagedListView(
            pagingController: cubit.pagingController,
            fetchData: (page, limit) => cubit.getTickets(page, limit),
            disposeController: false,
            buildItem: (item, index) {
              final ticket = item as Ticket;
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: TicketWidget(
                    ticket: ticket,
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
