import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/presentation/pages/request%20service/request_service_screen.dart';
import 'package:mynt/presentation/pages/sign%20in/sign_in_screen.dart';
import 'package:mynt/presentation/pages/sign%20up/create%20password/create_password.dart';
import 'package:mynt/presentation/pages/sign%20up/email%20verification/email_verfication.dart';
import 'package:mynt/presentation/pages/sign%20up/sign_up_screen.dart';
import 'package:mynt/presentation/pages/ticket%20details/ticket_details_screen.dart';
import 'package:mynt/presentation/pages/unit%20details/unit_details_screen.dart';

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
        home: const CreatePassword(),
      ),
    );
  }
}
