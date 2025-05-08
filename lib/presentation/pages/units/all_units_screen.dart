import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/pages/unit%20details/unit_details_screen.dart';

class AllUnitsScreen extends StatefulWidget {
  const AllUnitsScreen({super.key});

  @override
  State<AllUnitsScreen> createState() => _AllUnitsScreenState();
}

class _AllUnitsScreenState extends State<AllUnitsScreen> {
  final List<Map<String, String>> allUnits = [
    {
      "title": "Monte Galala studio",
      "uid": "551554",
      "image":
          "https://s3-alpha-sig.figma.com/img/4192/e064/bb665d65b39d3dc5aa3969c64a25d37d?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YFRhjKapoPJqEyLOR~x5A05Em6wR43AtW7RILTmAbc5NT5rziyxF~TsEo9U~J7R9zADzhe8jC~QHAwHHmX1oF3pccnYeWzXPsN0~P1hqSIRiToMkY9I7nAz2QRhGkJrcD8X~cD0c~0RdtEmEcknz8i4I51zI9EjF2llLPHy9xT3iNNjRQu4miwVoG4kxf0Ilkns6XjdAMr4P0GZ0oE0W~VXfLVaiQlXBL~WEdEr8qwoVi2y2RCkq3Xq-eFsXP7PU3h1CqjJHGaOek3XDgSQBNxJcAwkpPUTQhtb2LyFMSvt5RwOCAogAifm2--f7nortBVIuhAr6gVj341P3FNiePQ__",
    },
    {
      "title": "Monte Galala studio",
      "uid": "551554",
      "image":
          "https://s3-alpha-sig.figma.com/img/4192/e064/bb665d65b39d3dc5aa3969c64a25d37d?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YFRhjKapoPJqEyLOR~x5A05Em6wR43AtW7RILTmAbc5NT5rziyxF~TsEo9U~J7R9zADzhe8jC~QHAwHHmX1oF3pccnYeWzXPsN0~P1hqSIRiToMkY9I7nAz2QRhGkJrcD8X~cD0c~0RdtEmEcknz8i4I51zI9EjF2llLPHy9xT3iNNjRQu4miwVoG4kxf0Ilkns6XjdAMr4P0GZ0oE0W~VXfLVaiQlXBL~WEdEr8qwoVi2y2RCkq3Xq-eFsXP7PU3h1CqjJHGaOek3XDgSQBNxJcAwkpPUTQhtb2LyFMSvt5RwOCAogAifm2--f7nortBVIuhAr6gVj341P3FNiePQ__",
    },
    {
      "title": "Monte Galala studio",
      "uid": "551554",
      "image":
          "https://s3-alpha-sig.figma.com/img/4192/e064/bb665d65b39d3dc5aa3969c64a25d37d?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YFRhjKapoPJqEyLOR~x5A05Em6wR43AtW7RILTmAbc5NT5rziyxF~TsEo9U~J7R9zADzhe8jC~QHAwHHmX1oF3pccnYeWzXPsN0~P1hqSIRiToMkY9I7nAz2QRhGkJrcD8X~cD0c~0RdtEmEcknz8i4I51zI9EjF2llLPHy9xT3iNNjRQu4miwVoG4kxf0Ilkns6XjdAMr4P0GZ0oE0W~VXfLVaiQlXBL~WEdEr8qwoVi2y2RCkq3Xq-eFsXP7PU3h1CqjJHGaOek3XDgSQBNxJcAwkpPUTQhtb2LyFMSvt5RwOCAogAifm2--f7nortBVIuhAr6gVj341P3FNiePQ__",
    },
    {
      "title": "Monte Galala studio",
      "uid": "551554",
      "image":
          "https://s3-alpha-sig.figma.com/img/4192/e064/bb665d65b39d3dc5aa3969c64a25d37d?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YFRhjKapoPJqEyLOR~x5A05Em6wR43AtW7RILTmAbc5NT5rziyxF~TsEo9U~J7R9zADzhe8jC~QHAwHHmX1oF3pccnYeWzXPsN0~P1hqSIRiToMkY9I7nAz2QRhGkJrcD8X~cD0c~0RdtEmEcknz8i4I51zI9EjF2llLPHy9xT3iNNjRQu4miwVoG4kxf0Ilkns6XjdAMr4P0GZ0oE0W~VXfLVaiQlXBL~WEdEr8qwoVi2y2RCkq3Xq-eFsXP7PU3h1CqjJHGaOek3XDgSQBNxJcAwkpPUTQhtb2LyFMSvt5RwOCAogAifm2--f7nortBVIuhAr6gVj341P3FNiePQ__",
    },
    {
      "title": "Monte Galala studio",
      "uid": "551554",
      "image":
          "https://s3-alpha-sig.figma.com/img/4192/e064/bb665d65b39d3dc5aa3969c64a25d37d?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=YFRhjKapoPJqEyLOR~x5A05Em6wR43AtW7RILTmAbc5NT5rziyxF~TsEo9U~J7R9zADzhe8jC~QHAwHHmX1oF3pccnYeWzXPsN0~P1hqSIRiToMkY9I7nAz2QRhGkJrcD8X~cD0c~0RdtEmEcknz8i4I51zI9EjF2llLPHy9xT3iNNjRQu4miwVoG4kxf0Ilkns6XjdAMr4P0GZ0oE0W~VXfLVaiQlXBL~WEdEr8qwoVi2y2RCkq3Xq-eFsXP7PU3h1CqjJHGaOek3XDgSQBNxJcAwkpPUTQhtb2LyFMSvt5RwOCAogAifm2--f7nortBVIuhAr6gVj341P3FNiePQ__",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Text(""),
        elevation: 0,
        title: Text(
          "All Units",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Total Units 12",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w600,
                  color: AppColors.text1,
                ),
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allUnits.length,
                itemBuilder: (context, index) {
                  final unit = allUnits[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: _buildUnitContainer(unit),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnitContainer(Map<String, String> unit) {
    return Container(
      padding: EdgeInsets.all(14.w),
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
                backgroundImage: CachedNetworkImageProvider(unit["image"]!),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            unit["title"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              fontFamily: "Montserrat",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Unit ID: ",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12.sp,
                            fontFamily: "Montserrat",
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          unit["uid"]!,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
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
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F525B),
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
        ],
      ),
    );
  }
}
