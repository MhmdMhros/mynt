import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              index: _selectedIndex,
              children: _screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: const Color(0xFF0F525B),
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              selectedLabelStyle:
                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              items: [
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
