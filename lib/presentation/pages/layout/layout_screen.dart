import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/bloc/cubit.dart';
import 'package:mynt/presentation/bloc/state.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MainCubit(),
        child: BlocBuilder<MainCubit, MainStates>(builder: (context, state) {
          var cubit = MainCubit.get(context);
          return Scaffold(
            body: IndexedStack(
              index: cubit.currentIndex,
              children: cubit.screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: cubit.changeBottomBar,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.text2,
              showUnselectedLabels: true,
              selectedLabelStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard_rounded), label: "Dashboard"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.home_work_outlined), label: "Units"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.airplane_ticket_outlined),
                    label: "Tickets"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.more_vert_rounded), label: "More"),
              ],
            ),
          );
        }));
  }
}
