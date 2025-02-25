import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynt/core/constants/app_colors.dart';
import 'package:mynt/presentation/pages/balance%20details/balance_details_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Column(
            children: [
              // App Bar
              Container(
                height: 0.25.sh,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF0F525B),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.only(right: 24.w, left: 24.w, bottom: 60.h),
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
                      Container(
                        padding: EdgeInsets.all(8.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Icon(
                          Icons.notifications_outlined,
                          color: const Color(0xFF0F525B),
                          size: 25.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Scrollable Content
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
                          _buildSectionTitle("Current Balance", () {}, false),
                          SizedBox(height: 10.h),

                          _buildCurrentBalance(context),
                          SizedBox(height: 16.h),

                          // Rented Units Section
                          _buildSectionTitle("Rented Units", () {}, true),
                          SizedBox(height: 10.h),
                          _buildRentedUnitsList(),

                          SizedBox(height: 16.h),

                          // Required Action Section
                          _buildSectionTitle("Required Action", () {}, true),
                          SizedBox(height: 10.h),
                          _buildActionCard(),

                          SizedBox(height: 16.h),

                          // Last Tickets Section
                          _buildSectionTitle("Tickets", () {}, true),
                          SizedBox(height: 10.h),
                          _buildTicketCard(),

                          SizedBox(height: 16.h),
                          _buildSectionTitle("News", () {}, true),
                          SizedBox(height: 10.h),
                          Column(
                            children: [
                              buildProductList([
                                {
                                  "image":
                                      "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
                                  "description":
                                      "This is a great product with amazing features.",
                                  "date": "2/5/2023"
                                },
                                {
                                  "image":
                                      "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
                                  "description":
                                      "Another amazing product with high-quality design.",
                                  "date": "10/6/2023"
                                },
                                {
                                  "image":
                                      "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
                                  "description":
                                      "Best-selling product with great user reviews.",
                                  "date": "15/7/2023"
                                },
                              ]),
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
  }

  Widget _buildSectionTitle(
      String title, VoidCallback onSeeAllPressed, bool isSeeAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat"),
        ),
        if (isSeeAll)
          TextButton(
            onPressed: onSeeAllPressed,
            child: Text(
              "See all",
              style: TextStyle(fontSize: 18.sp, fontFamily: "Montserrat"),
            ),
          ),
      ],
    );
  }

  Widget _buildRow(IconData icon, String label, String value,
      [Color? valueColor]) {
    return Row(
      children: [
        Icon(icon, size: 18.sp, color: Colors.grey),
        SizedBox(width: 6.w),
        Text(label,
            style: TextStyle(fontSize: 12.sp, fontFamily: "Montserrat")),
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
          return IntrinsicWidth(
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
                        radius: 25.r,
                        backgroundImage: const CachedNetworkImageProvider(
                            "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg"),
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
                                  fontSize: 16.sp,
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
                                        fontSize: 12.sp,
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
                  _buildRow(Icons.bookmark_border_rounded,
                      "Booking Duration   ", "07/1/2025 - 30/3/2025"),
                  SizedBox(height: 10.h),
                  _buildRow(Icons.balance_rounded, "January Balance     ",
                      "-3,500 EGP", Colors.red),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildActionCard() {
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
                              fontSize: 16.sp,
                              fontFamily: "Montserrat"),
                        ),
                      ],
                    ),
                    Text(
                      "15 Feb 2025",
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14.sp,
                          fontFamily: "Montserrat"),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F525B),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                    size: 20.sp,
                  ),
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
                              fontSize: 16.sp,
                              fontFamily: "Montserrat"),
                        ),
                        SizedBox(width: 5.w),
                        SvgPicture.asset(
                          "assets/images/dollarImage.svg",
                          width: 20.w,
                          height: 20.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "for all unitsfor all units",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15.sp,
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
                          builder: (context) => const BalanceDetailsScreen()),
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
                      size: 20.sp,
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
                      fontSize: 20.sp,
                      color: const Color(0xFF0F525B),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Montserrat"),
                ),
                Text(
                  "33,700.0",
                  style: TextStyle(
                      fontSize: 22.sp,
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
    final PageController _pageController = PageController();

    final List<String> images = [
      "https://letsenhance.io/static/73136da51c245e80edc6ccfe44888a99/1015f/MainBefore.jpg",
      "https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D",
      "https://gratisography.com/wp-content/uploads/2024/11/gratisography-augmented-reality-800x525.jpg",
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
              controller: _pageController,
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
          controller: _pageController,
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

  Widget _buildTicketCard() {
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
                Row(
                  children: [
                    Text(
                      "Ticket Num: ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Text(
                      "#637893",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
                Text(
                  "18/1/2025 3:45PM",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                    fontFamily: "Montserrat",
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Ticket Sort: ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black87,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Text(
                      "Gate Pass",
                      style: TextStyle(
                        fontSize: 14.sp,
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
                      fontSize: 15.sp,
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
    );
  }

  Widget buildProductList(List<Map<String, String>> products) {
    return SizedBox(
      height: 320.h, // Responsive height
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 10.h),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(products[index]);
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
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
                  fontSize: 14.sp,
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
                      fontSize: 16.sp,
                      color: Colors.grey[700],
                      fontFamily: "Montserrat", // Apply Montserrat font
                    ),
                  ),
                  SizedBox(
                    width: 120.w, // Responsive width
                    height: 40.h, // Responsive height
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle view action
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
                          fontSize: 16.sp,
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
