// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynt/core/app_prefs/app_prefs.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/di.dart';
import 'package:mynt/presentation/pages/layout/cubit/layout_cubit.dart';
import 'package:mynt/presentation/pages/sign%20in/sign_in_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  void initState() {
    super.initState();
    _handleUserLogic();
  }

  Future<void> resetIsInMainLayout() async {
    await getIt<AppPreferences>().resetIsUserLogin();
    await getIt<AppPreferences>().saveIsOnBoardingScreenViewed();
  }

  Future<void> _handleUserLogic() async {
    final cubit = LayoutCubit.get(context);
    final userFetched = await cubit.getUser();
    if (!userFetched) {
      final refreshed = await cubit.refreshToken();
      if (refreshed) {
        final retried = await cubit.getUser();
        if (!retried) _showLoginPopup();
      } else {
        _showLoginPopup();
      }
    }
  }

  void _showLoginPopup() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text("Session Expired"),
          content: const Text("Please login again."),
          actions: [
            TextButton(
              onPressed: () async {
                await resetIsInMainLayout();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SignInScreen()),
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(builder: (context, state) {
      var cubit = LayoutCubit.get(context);
      return Scaffold(
        body: IndexedStack(
          index: cubit.bottomNavIndex,
          children: cubit.screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.bottomNavIndex,
          onTap: cubit.changeCurrentSelectedBottomNavIndex,
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
                icon: Icon(Icons.airplane_ticket_outlined), label: "Tickets"),
            BottomNavigationBarItem(
                icon: Icon(Icons.more_vert_rounded), label: "More"),
          ],
        ),
      );
    });
  }
}
