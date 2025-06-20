// ignore_for_file: prefer_is_empty

import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/app_prefs/app_prefs.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/di.dart';
import 'package:mynt/domain/entities/article.dart';
import 'package:mynt/presentation/pages/balances/balances_Screen.dart';
import 'package:mynt/presentation/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:mynt/presentation/pages/layout/cubit/layout_cubit.dart';
import 'package:mynt/presentation/pages/maintenance%20service/maintenance_service_screen.dart';
import 'package:mynt/presentation/pages/news%20details/news_details_screen.dart';
import 'package:mynt/presentation/pages/news/news_screen.dart';
import 'package:mynt/presentation/pages/notifications/notifications_screen.dart';
import 'package:mynt/presentation/pages/ticket%20details/ticket_details_screen.dart';
import 'package:mynt/presentation/pages/unit%20details/unit_details_screen.dart';
import 'package:restart_app/restart_app.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
    _handleHomeLogic();
  }

  Future<void> resetIsInMainLayout() async {
    await getIt<AppPreferences>().resetIsUserLogin();
    await getIt<AppPreferences>().saveIsOnBoardingScreenViewed();
  }

  void _handleHomeLogic() async {
    final cubit = DashboardCubit.get(context);
    final homeFetched = await cubit.getHomeData();
    if (homeFetched) {
      await cubit.getAllAccountSummary();
    } else {
      _showLoginPopup();
      showToast('Error to fetch data!!!.', ToastType.error);
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
                Restart.restartApp();
              },
              child: const Text("Login"),
            ),
          ],
        ),
      );
    });
  }

  // ✅ FIXED WIDGET TREE
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _handleHomeLogic();
      },
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          final cubit = DashboardCubit.get(context);
          if (state is GetHomeDataSuccess ||
              state is GetUnreadNotificationsCountSuccess ||
              state is GetAccountSummarySuccess ||
              state is DecreamentUnreadNotificationsCountSuccess) {
            return Scaffold(
              backgroundColor: Colors.grey[200],
              body: LayoutBuilder(builder: (context, constraints) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 0.25.sh,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Color(0xFF0F525B),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    right: 24.w, left: 24.w, bottom: 60.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: SvgPicture.asset(
                                        "assets/images/myntNameImage2.svg",
                                        height: 50.h,
                                        width: 100.w,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const NotificationsScreen(),
                                          ),
                                        );
                                      },
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(8.w),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Icon(
                                              Icons.notifications_outlined,
                                              color: const Color(0xFF0F525B),
                                              size: 20.sp,
                                            ),
                                          ),
                                          if (cubit.unreadNotificationsCount >
                                              0)
                                            Positioned(
                                              top: -4,
                                              right: -4,
                                              child: Container(
                                                padding: EdgeInsets.all(4.w),
                                                decoration: const BoxDecoration(
                                                  color: Colors.red,
                                                  shape: BoxShape.circle,
                                                ),
                                                constraints: BoxConstraints(
                                                  minWidth: 18.w,
                                                  minHeight: 18.w,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    cubit.unreadNotificationsCount >
                                                            9
                                                        ? '9+'
                                                        : cubit
                                                            .unreadNotificationsCount
                                                            .toString(),
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 70.h),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 50.h),
                                    _buildSectionTitle(
                                        "Current Balance", () {}, false),
                                    SizedBox(height: 10.h),
                                    _buildCurrentBalance(context),
                                    SizedBox(height: 16.h),
                                    _buildSectionTitle("Rented Units", () {
                                      LayoutCubit.get(context)
                                          .changeCurrentSelectedBottomNavIndex(
                                              1);
                                    }, true),
                                    SizedBox(height: 10.h),
                                    _buildRentedUnitsList(),
                                    SizedBox(height: 16.h),
                                    _buildSectionTitle("Tickets", () {
                                      LayoutCubit.get(context)
                                          .changeCurrentSelectedBottomNavIndex(
                                              2);
                                    }, true),
                                    SizedBox(height: 10.h),
                                    _buildTicketCard(context),
                                    SizedBox(height: 16.h),
                                    _buildSectionTitle("News", () {
                                      final articles =
                                          cubit.dashboardData?.articles;
                                      if (articles != null) {
                                        Navigator.of(context).push(
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                NewsScreen(articles),
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
                                              return FadeTransition(
                                                opacity: animation,
                                                child: child,
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    }, true),
                                    SizedBox(height: 10.h),
                                    buildProductList(context),
                                    SizedBox(height: 30.h),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 120.h, left: 15.w, right: 15.w),
                          child: _buildNewAds(),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildSectionTitle(
      String title, VoidCallback onSeeAllPressed, bool isSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat"),
        ),
        if (isSeeAll)
          TextButton(
            onPressed: onSeeAllPressed,
            child: Text(
              "See all",
              style: TextStyle(fontSize: 14.sp, fontFamily: "Montserrat"),
            ),
          ),
      ],
    );
  }

  Widget _buildRow(IconData icon, String label, String value,
      [Color? valueColor]) {
    return Row(
      children: [
        Icon(icon, size: 15.sp, color: Colors.grey),
        SizedBox(width: 6.w),
        Text(label,
            style: TextStyle(fontSize: 12.sp, fontFamily: "Montserrat")),
        SizedBox(width: 18.w),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: valueColor ?? Colors.black,
                fontFamily: "Montserrat"),
          ),
        ),
      ],
    );
  }

  Widget _buildRentedUnitsList() {
    var cubit = DashboardCubit.get(context);
    final bookings = cubit.dashboardData?.bookings ?? [];

    if (bookings.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/empty.svg",
              height: 80.h,
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          final booking = bookings[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      UnitDetailsScreen(booking.id ?? 0),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                ),
              );
            },
            child: IntrinsicWidth(
              child: Container(
                margin: EdgeInsets.only(right: 10.w),
                padding: EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24.r,
                          backgroundImage: CachedNetworkImageProvider(
                            booking.gallery?.isNotEmpty == true
                                ? booking.gallery!.first.s ?? ''
                                : '',
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                booking.title ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    fontFamily: "Montserrat"),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined,
                                      size: 18.sp, color: Colors.grey),
                                  SizedBox(width: 4.w),
                                  Expanded(
                                    child: Text(
                                      booking.projectAddress ?? '',
                                      style: TextStyle(
                                          color: Colors.grey[800],
                                          fontSize: 10.sp,
                                          fontFamily: "Montserrat"),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    _buildRow(
                      Icons.bookmark_border_rounded,
                      "Booking Duration",
                      "${booking.checkin ?? ''} - ${booking.checkout ?? ''}",
                    ),
                    SizedBox(height: 10.h),
                    _buildRow(
                      Icons.balance_rounded,
                      "Balance",
                      "EGP ${booking.balance ?? ''}",
                      Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Maintenance Service 🔧 ",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              fontFamily: "Montserrat"),
                        ),
                      ],
                    ),
                    Text(
                      "15 Feb 2025",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12.sp,
                          fontFamily: "Montserrat"),
                    ),
                  ],
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F525B),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 15.sp,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const MaintenanceServiceScreen()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              "Description of the required action goes here.",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black87,
                  fontFamily: "Montserrat"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCurrentBalance(BuildContext context) {
    var cubit = DashboardCubit.get(context);
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 239, 243),
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.r)],
      ),
      child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Net Balance",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14.sp,
                              fontFamily: "Montserrat"),
                        ),
                        SizedBox(width: 5.w),
                        SvgPicture.asset(
                          "assets/images/dollarImage.svg",
                          width: 15.w,
                          height: 15.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "for all units",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.sp,
                        fontFamily: "Montserrat",
                      ),
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis, // Adds ellipsis (...) if text overflows
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    if (cubit.accountSummaryData != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BalancesScreen(
                                cubit.accountSummaryData!, true, '')),
                      );
                    } else {
                      showToast('Try again later.', ToastType.info);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F525B),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                      size: 15.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  "EGP  ",
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF0F525B),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat"),
                ),
                Text(
                  DashboardCubit.get(context).dashboardData!.balance ?? '',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: const Color(0xFF0F525B),
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewAds() {
    final PageController pageController = PageController();

    // final List<String> images = [
    //   "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
    //   "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
    //   "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
    // ];

    return Column(
      children: [
        Container(
          height: 160.h,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F4F5),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: PageView.builder(
              controller: pageController,
              itemCount:
                  DashboardCubit.get(context).dashboardData?.banners?.length ??
                      0,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: DashboardCubit.get(context)
                          .dashboardData
                          ?.banners
                          ?.elementAt(index)
                          .featuredImage ??
                      '',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[300],
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(Icons.error, color: Colors.red, size: 30.w),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 16.h),
        SmoothPageIndicator(
          controller: pageController,
          count:
              DashboardCubit.get(context).dashboardData?.banners?.length ?? 0,
          effect: JumpingDotEffect(
            dotHeight: 10.h,
            dotWidth: 10.w,
            activeDotColor:
                AppColors.primary, // Replace with AppColors.primary if defined
            dotColor: const Color.fromARGB(255, 218, 216, 216),
          ),
        ),
      ],
    );
  }

  Widget _buildTicketCard(BuildContext context) {
    var cubit = DashboardCubit.get(context);
    final tickets = cubit.dashboardData?.tickets ?? [];

    if (tickets.isEmpty) {
      return const SizedBox();
    }

    final ticket = tickets.last;
    final statusId = ticket.statusId ?? 0;
    final statusText = ticket.statusText ?? '';

    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                TicketDetailsScreen(ticket),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          "Ticket Title: ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        Expanded(
                          child: Text(
                            ticket.title ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "${ticket.creationDate ?? ''} ${ticket.creationTime ?? ''}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Ticket Num: ",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black87,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      Text(
                        '#${ticket.id?.toString() ?? ''}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      color: getStatusBackgroundColorById(statusId),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: getStatusTextColorById(statusId),
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductList(BuildContext context) {
    var cubit = DashboardCubit.get(context);
    final articles = cubit.dashboardData?.articles ?? [];

    if (articles.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/empty.svg',
              height: 150.h,
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 320.h, // Responsive height
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 10.h),
        scrollDirection: Axis.horizontal,
        itemCount: min(articles.length, 3),
        itemBuilder: (context, index) {
          final article = articles[index];
          return _buildProductCard(article, context);
        },
      ),
    );
  }

  Widget _buildProductCard(Article article, BuildContext context) {
    return Container(
      width: 300.w, // Responsive width
      margin: EdgeInsets.only(right: 12.w),
      child: Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
              child: CachedNetworkImage(
                imageUrl: article.image ?? '',
                width: double.infinity,
                height: 180.h, // Adjust height responsively
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Icon(
                  Icons.image_not_supported,
                  size: 80.w,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 8.h),

            // Product Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              child: Text(
                article.title ?? '',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat", // Apply Montserrat font
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Row with Date & View Button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    article.publishedAt ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[700],
                      fontFamily: "Montserrat", // Apply Montserrat font
                    ),
                  ),
                  SizedBox(
                    width: 120.w, // Responsive width
                    height: 40.h, // Responsive height
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    NewsDetailsScreen(article),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              ); // Uses a smoother transition
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        "View",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontFamily: "Montserrat", // Apply Montserrat font
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
