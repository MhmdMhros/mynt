import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/pages/bottom%20sheets/rating_bottom_sheet.dart';

class TicketDetailsScreen extends StatefulWidget {
  const TicketDetailsScreen({super.key});

  @override
  State<TicketDetailsScreen> createState() => _TicketDetailsScreenState();
}

class _TicketDetailsScreenState extends State<TicketDetailsScreen> {
  int? selectedRate;
  String feedback = '';

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return const RatingBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      "https://s3-alpha-sig.figma.com/img/ae43/08b5/aea0ab2ab3a15afc5279eef129f57706?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PANPJZMWxnD1dfTGPVhl9FlrOauZK63HqIQP0VL3XUU-O6oEhI3Jg0TT7nWqUqYppvYaKPSd1jAu-3HR2tFlq58ecRD~3gfR~ssSfMBo~Dr5RtmmnX-O8urDziYyVwl~2y~Xk6nAfzl6u-YMvIhyyLstBdmEcv8WCGL8gwP1UpuOe3tkvATEK8vRWED7m4-Ib2qHFLjb2arPNjwsdv7VbMCOM41KuUoEn5O3AOD2OlhmTsaFDeDGlc8g-9BROmnIVmUxbhegzmFO4gUWLl3xk1DDFct2et2002D-1CeKBZpbqqbypbMHNezF3XoIEUaDdIlc14AuRaslGmc7JTjg3w__",
      "https://s3-alpha-sig.figma.com/img/ae43/08b5/aea0ab2ab3a15afc5279eef129f57706?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PANPJZMWxnD1dfTGPVhl9FlrOauZK63HqIQP0VL3XUU-O6oEhI3Jg0TT7nWqUqYppvYaKPSd1jAu-3HR2tFlq58ecRD~3gfR~ssSfMBo~Dr5RtmmnX-O8urDziYyVwl~2y~Xk6nAfzl6u-YMvIhyyLstBdmEcv8WCGL8gwP1UpuOe3tkvATEK8vRWED7m4-Ib2qHFLjb2arPNjwsdv7VbMCOM41KuUoEn5O3AOD2OlhmTsaFDeDGlc8g-9BROmnIVmUxbhegzmFO4gUWLl3xk1DDFct2et2002D-1CeKBZpbqqbypbMHNezF3XoIEUaDdIlc14AuRaslGmc7JTjg3w__",
      "https://s3-alpha-sig.figma.com/img/ae43/08b5/aea0ab2ab3a15afc5279eef129f57706?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=PANPJZMWxnD1dfTGPVhl9FlrOauZK63HqIQP0VL3XUU-O6oEhI3Jg0TT7nWqUqYppvYaKPSd1jAu-3HR2tFlq58ecRD~3gfR~ssSfMBo~Dr5RtmmnX-O8urDziYyVwl~2y~Xk6nAfzl6u-YMvIhyyLstBdmEcv8WCGL8gwP1UpuOe3tkvATEK8vRWED7m4-Ib2qHFLjb2arPNjwsdv7VbMCOM41KuUoEn5O3AOD2OlhmTsaFDeDGlc8g-9BROmnIVmUxbhegzmFO4gUWLl3xk1DDFct2et2002D-1CeKBZpbqqbypbMHNezF3XoIEUaDdIlc14AuRaslGmc7JTjg3w__"
    ];
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.w),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.text1),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        title: Text(
          "Ticket Details",
          style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container with Text
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEDF8EE),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "ticket is being processed by the team",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF328039),
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Reject Reason",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: const Color(0xFFBF4C43),
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey[300]),
                        Text(
                          "This is a detailed description of the maintenance service required.",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),

                  _buildInfoContainer("Ticket #637893", [
                    _buildInfoRow("Type", "Maintenance"),
                    _buildInfoRow("Date", "18 Jan 2025"),
                    _buildInfoRow("Time", "3:45 PM"),
                  ]),
                  SizedBox(height: 10.h),

                  Container(
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ticket Description",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: Colors.black,
                          ),
                        ),
                        Divider(thickness: 1, color: Colors.grey[300]),
                        Text(
                          "This is a detailed description of the maintenance service required.",
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: "Montserrat",
                              color: Colors.black87),
                        ),
                        SizedBox(height: 10.h),
                        _buildImageRow(imageUrls),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),

                  _buildInfoContainer("Unit Details", [
                    _buildInfoRow("Compound", "Festival"),
                    _buildInfoRow("Unit ID", "12225"),
                  ]),
                  SizedBox(height: 10.h),

                  // Container with Column
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text
                        Text(
                          "Responsible Person",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 10.h),

                        // Row (Image + Name)
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 25.r,
                              backgroundImage: const CachedNetworkImageProvider(
                                'https://s3-alpha-sig.figma.com/img/2eb7/499e/f4c7018a2473ea64f2bcac990ed3d939?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=JsJTUwpKdY3M15DkeiUcmU1T760qAVdTrxFWzCWjVjNweSYzvOZaF5iY4S3dt9A~8oc26Cn5HhG1dVdxFfMwxMD5GZXLLE4GRVwswPu7WWcT7yggMp3EUE82yPD9g5KBexmZ3nyE8C54sm9wyMLyv9eUYHMPG5qJ7yMZNr~f9aai6Xzu1IrINgJE5lYBm6Fn01VvBrM-YLRiAJKI9pSvDXiqVD7z~-S7iU-TFjLC83HQ5HyXEIsJzsrQbS6JrRTTVu20YBaZCoHmmToH2jrNH2sHaJRKKwB6TaVV-kARGsVRbOdNgWdqb~Y29faqOglcel9TAt1RW8jloXvvJpQ5dA__', // Replace with the actual user image URL
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              "Ahmed Omar",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF262626),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),

                        // Row with Buttons (Call & Chat)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                icon:
                                    const Icon(Icons.call, color: Colors.white),
                                label: Text(
                                  "Call",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                ),
                                icon:
                                    const Icon(Icons.chat, color: Colors.white),
                                label: Text(
                                  "Chat",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                icon: const Icon(Icons.star,
                    color: Colors.white), // Add star icon for rating
                label: Text(
                  "Rate",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Montserrat",
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showBottomSheet(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "Montserrat",
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoContainer(String title, List<Widget> children) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              fontFamily: "Montserrat",
              color: AppColors.primary,
            ),
          ),
          Divider(thickness: 1, height: 20.h, color: Colors.grey[300]),
          ...children,
        ],
      ),
    );
  }

  Widget _buildImageRow(List<String> imageUrls) {
    return Row(
      children: imageUrls
          .map((url) => Padding(
                padding: EdgeInsets.only(right: 8.w),
                child: CachedNetworkImage(
                  imageUrl: url,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(Icons.image, color: Colors.white),
                  ),
                  errorWidget: (context, url, error) => Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: const Icon(Icons.error, color: Colors.white),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
