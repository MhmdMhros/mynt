import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynt/presentation/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:mynt/presentation/pages/layout/cubit/layout_cubit.dart';
import 'package:mynt/presentation/pages/more/cubit/more_cubit.dart';
import 'package:mynt/presentation/pages/notifications/cubit/notifications_cubit.dart';
import 'package:mynt/presentation/pages/tickets/cubit/tickets_cubit.dart';
import 'package:mynt/presentation/pages/units/cubit/units_cubit.dart';
import 'package:mynt/di.dart';

class CubitManager {
  static Future<void> disposeAllCubits(BuildContext context) async {
    final dashboardCubit = context.read<DashboardCubit>();
    final unitsCubit = context.read<UnitsCubit>();
    final ticketsCubit = context.read<TicketsCubit>();
    final notificationsCubit = context.read<NotificationsCubit>();
    final layoutCubit = context.read<LayoutCubit>();
    final moreCubit = context.read<MoreCubit>();

    await Future.wait([
      dashboardCubit.close(),
      unitsCubit.close(),
      ticketsCubit.close(),
      notificationsCubit.close(),
      layoutCubit.close(),
      moreCubit.close(),
    ]);
  }

  static MultiBlocProvider initAllCubits({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LayoutCubit>(create: (_) => getIt<LayoutCubit>()),
        BlocProvider<DashboardCubit>(create: (_) => getIt<DashboardCubit>()),
        BlocProvider<UnitsCubit>(create: (_) => getIt<UnitsCubit>()),
        BlocProvider<NotificationsCubit>(
            create: (_) => getIt<NotificationsCubit>()),
        BlocProvider<TicketsCubit>(create: (_) => getIt<TicketsCubit>()),
        BlocProvider<MoreCubit>(
          create: (_) => getIt<MoreCubit>()
            ..getSettingsData()
            ..getSettingsDataWithoutSlugs(),
        ),
      ],
      child: child,
    );
  }
}

// 🧠 الاستخدام:
// 1. عند تسجيل الخروج:
// CubitManager.disposeAllCubits(context);
// Navigator.pushAndRemoveUntil(...);

// 2. عند الدخول:
// CubitManager.initAllCubits(child: DashboardScreen());
