import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/app/functions.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/pages/balances/balances_Screen.dart';
import 'package:mynt/presentation/pages/dashboard/cubit/dashboard_cubit.dart';
import 'package:mynt/presentation/pages/maintenance%20service/maintenance_service_screen.dart';
import 'package:mynt/presentation/pages/news%20details/news_details_screen.dart';
import 'package:mynt/presentation/pages/news/news_screen.dart';
import 'package:mynt/presentation/pages/notifications/notifications_screen.dart';
import 'package:mynt/presentation/pages/required%20actions/required_actions_screen.dart';
import 'package:mynt/presentation/pages/ticket%20details/ticket_details_screen.dart';
import 'package:mynt/presentation/pages/unit%20details/unit_details_screen.dart';
import 'package:mynt/presentation/pages/units/units_screen.dart';
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

  Future<void> _handleHomeLogic() async {
    final cubit = DashboardCubit.get(context);
    final homeFetched = await cubit.getHomeData();
    if (homeFetched) {
      showToast('Congratulations!!!.', ToastType.success);
    } else {
      showToast('Oooooooops!!!.', ToastType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
      final cubit = DashboardCubit.get(context);
      if (state is GetHomeDataSuccess) {
        return Scaffold(
          backgroundColor: Colors.grey[200],
          body: Stack(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                Icons.notifications_outlined,
                                color: const Color(0xFF0F525B),
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 70.h),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
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

                              // Rented Units Section
                              _buildSectionTitle("Rented Units", () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const UnitsScreen(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ); // Uses a smoother transition
                                    },
                                  ),
                                );
                              }, true),
                              SizedBox(height: 10.h),
                              _buildRentedUnitsList(),

                              SizedBox(height: 16.h),

                              // Required Action Section
                              _buildSectionTitle("Required Action", () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const RequiredActionsScreen(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ); // Uses a smoother transition
                                    },
                                  ),
                                );
                              }, true),
                              SizedBox(height: 10.h),
                              _buildActionCard(context),

                              SizedBox(height: 16.h),

                              // Last Tickets Section
                              _buildSectionTitle("Tickets", () {
                                // Navigator.of(context).push(
                                //   PageRouteBuilder(
                                //     pageBuilder:
                                //         (context, animation, secondaryAnimation) =>
                                //             const TicketsScreen(),
                                //     transitionsBuilder: (context, animation,
                                //         secondaryAnimation, child) {
                                //       return FadeTransition(
                                //         opacity: animation,
                                //         child: child,
                                //       ); // Uses a smoother transition
                                //     },
                                //   ),
                                // );
                              }, false),
                              SizedBox(height: 10.h),
                              _buildTicketCard(context),

                              SizedBox(height: 16.h),
                              _buildSectionTitle("News", () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const NewsScreen(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity: animation,
                                        child: child,
                                      ); // Uses a smoother transition
                                    },
                                  ),
                                );
                              }, true),
                              SizedBox(height: 10.h),
                              Column(
                                children: [
                                  buildProductList([
                                    {
                                      "image":
                                          "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
                                      "description":
                                          "This is a great product with amazing features.",
                                      "date": "2/5/2023"
                                    },
                                    {
                                      "image":
                                          "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
                                      "description":
                                          "Another amazing product with high-quality design.",
                                      "date": "10/6/2023"
                                    },
                                    {
                                      "image":
                                          "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
                                      "description":
                                          "Best-selling product with great user reviews.",
                                      "date": "15/7/2023"
                                    },
                                  ], context),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 120.h, left: 15.w, right: 15.w),
                child: _buildNewAds(),
              )
            ],
          ),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
    });
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
    return SizedBox(
      height: 140.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const UnitDetailsScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    ); // Uses a smoother transition
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
                          backgroundImage: const CachedNetworkImageProvider(
                              "https://s3-alpha-sig.figma.com/img/4192/e064/bb665d65b39d3dc5aa3969c64a25d37d?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YFRhjKapoPJqEyLOR~x5A05Em6wR43AtW7RILTmAbc5NT5rziyxF~TsEo9U~J7R9zADzhe8jC~QHAwHHmX1oF3pccnYeWzXPsN0~P1hqSIRiToMkY9I7nAz2QRhGkJrcD8X~cD0c~0RdtEmEcknz8i4I51zI9EjF2llLPHy9xT3iNNjRQu4miwVoG4kxf0Ilkns6XjdAMr4P0GZ0oE0W~VXfLVaiQlXBL~WEdEr8qwoVi2y2RCkq3Xq-eFsXP7PU3h1CqjJHGaOek3XDgSQBNxJcAwkpPUTQhtb2LyFMSvt5RwOCAogAifm2--f7nortBVIuhAr6gVj341P3FNiePQ__"),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Monte Galala studio",
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
                                      "Mount Ai Jalala, Suiz, Egypt",
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
                    _buildRow(Icons.bookmark_border_rounded, "Booking Duration",
                        "07/1/2025 - 30/3/2025"),
                    SizedBox(height: 10.h),
                    _buildRow(Icons.balance_rounded, "January Balance",
                        "-3,500 EGP", Colors.red),
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
                      "for all unitsfor all units",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BalancesScreen()),
                    );
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
                  "33,700.0",
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

    final List<String> images = [
      "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
      "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
      "https://s3-alpha-sig.figma.com/img/639c/a1b5/e3f3d145eb29b908bedb581ed0b1413a?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=SWyLvoOPvmWnuSY6iiMJLOz~b-KzYfIlZ2f5BI5EMPzNXwrhMVMjysrMJj4uMWLRz-kN393jEKL1h4ZkzN6ZhIAGBzVoIX90PywrcQqbqgAJ6VM9V6FDQzaQOXZrcxBH4krXG6mJC~zJvVYu66zIer0kaz3xrgU62JL60swRuUS3iGtsLYYCWUVJDgHs1dGZWNTZ5PVvvyXbvJd6iIhn4VVUAWxp0d9oJrgQEBkzxdcsrfZBndS1Ysv0W6OJznuO5hB~uVqx3R0Ck~uKqfht~H6RQHxanw426C5sla-IHm0iZbVfOkOvkJHiwQRHN459768lkyFEwO-2ipc3bM~GCg__",
    ];

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
              itemCount: images.length,
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: images[index],
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
          count: images.length,
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const UnitDetailsScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              ); // Uses a smoother transition
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
                          "Ticket Num: ",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        Text(
                          "#637893",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "18/1/2025 3:45PM",
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      fontFamily: "Montserrat",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Ticket Sort: ",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black87,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      Text(
                        "Gate Pass",
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
                      color: const Color.fromARGB(255, 231, 217, 219),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      "Expired",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.red,
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

  Widget buildProductList(
      List<Map<String, String>> products, BuildContext context) {
    return SizedBox(
      height: 320.h, // Responsive height
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 10.h),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(products[index], context);
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product, BuildContext context) {
    return Container(
      width: 300.w, // Responsive width
      margin: EdgeInsets.only(right: 12.w),
      child: Card(
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
                imageUrl: product["image"]!,
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
                product["description"]!,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
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
                    product["date"]!,
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
                                    const NewsDetailsScreen(),
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
