import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/presentation/pages/layout/layout_screen.dart';
import 'package:mynt/presentation/pages/maintenance%20service/maintenance_service_screen.dart';
import 'package:mynt/presentation/pages/news%20details/news_details_screen.dart';
import 'package:mynt/presentation/pages/news/news_screen.dart';
import 'package:mynt/presentation/pages/required%20actions/required_actions_screen.dart';
import 'package:mynt/presentation/pages/tickets/tickets_screen.dart';
import 'package:mynt/presentation/pages/units/all_units_screen.dart';
import 'package:mynt/presentation/pages/units/units_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'mynt',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TicketsScreen(),
      ),
    );
  }
}
