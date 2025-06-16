import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:mynt/core/resources/colors_manager.dart';

class AboutUsScreen extends StatefulWidget {
  final String aboutUsContentText;
  const AboutUsScreen(this.aboutUsContentText, {super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.transparent)
      ..loadHtmlString(_getHtmlContent());
  }

  String _getHtmlContent() {
    return '''
      <!DOCTYPE html>
      <html>
        <head>
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <style>
            body {
              font-family: Montserrat;
              color: #676767;
              font-size: 15px;
              font-weight: 500;
              padding: 0;
              margin: 0;
              background-color: transparent;
            }
            h5 {
              color: #0F525B;
              font-weight: 500;
            }
            img {
              max-width: 100%;
              height: auto;
            }
          </style>
        </head>
        <body>
          ${widget.aboutUsContentText}
        </body>
      </html>
    ''';
  }

  @override
  Widget build(BuildContext context) {
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
          "About Us",
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SvgPicture.asset(
                "assets/images/mynt.svg",
                width: 140.w,
                height: 140.h,
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              height: MediaQuery.of(context).size.height * 3,
              child: WebViewWidget(controller: _controller),
            ),
          ],
        ),
      ),
    );
  }
}
