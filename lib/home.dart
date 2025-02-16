import 'package:flutter/material.dart';
import 'package:mynt/dashboard.dart';
import 'package:mynt/more.dart';
import 'package:mynt/tickets.dart';
import 'package:mynt/units.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Screens
  final List<Widget> _screens = [
    DashBoardScreen(),
    UnitsScreen(),
    TicketsScreen(),
    MoreScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              icon: Icon(Icons.airplane_ticket_outlined), label: "Tickets"),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_vert_rounded), label: "More"),
        ],
      ),
    );
  }
}
