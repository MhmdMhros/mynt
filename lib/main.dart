import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynt/core/services/BlocObserver.dart';
import 'package:mynt/di.dart';
import 'package:mynt/presentation/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:mynt/presentation/pages/layout/cubit/layout_cubit.dart';
import 'package:mynt/presentation/pages/notifications/cubit/notifications_cubit.dart';
import 'package:mynt/presentation/pages/sign%20in/cubit/login_cubit.dart';
import 'package:mynt/presentation/pages/splash&onboarding/splash_screen.dart';
import 'package:mynt/presentation/pages/units/cubit/units_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (_) => getIt<LoginCubit>(),
          ),
          BlocProvider<LayoutCubit>(
            create: (_) => getIt<LayoutCubit>(),
          ),
          BlocProvider<DashboardCubit>(
            create: (_) => getIt<DashboardCubit>(),
          ),
          BlocProvider<UnitsCubit>(
            create: (_) => getIt<UnitsCubit>(),
          ),
          BlocProvider<NotificationsCubit>(
            create: (_) => getIt<NotificationsCubit>(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'mynt',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
        ),
      ),
    );
  }
}
