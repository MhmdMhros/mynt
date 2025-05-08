import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynt/core/resources/colors_manager.dart';
import 'package:mynt/presentation/pages/news/widgets/news_widget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> newsItems = [
      {
        "image":
            "https://s3-alpha-sig.figma.com/img/94de/0cbf/3e90a09eca6036d75eaa148a4caaab08?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=OC6s4HmXioTVQylDSGsMMSpwVYoaEauEppt52KIzvqR0dhP1nxnRtlsnmWDBhGporNdtww42tCYrmjJvmVIfjLfxLonNO75b5GJpBcLt8CGFXRl8gUeoLsLZ2jAVD-ipyiIk9hOGPx2GKEPGnu31qTlwITBx-Uzm1maR1f6vnwyK~i~t0Lqi4O2VOcTOBtWziqxpux8QhLSXgwwqbciGwSnnqrXm2F1KtD4KHJTc9SPkWSikl~kBBkGP~bMMTOUt7fzwefSwhiXstLsYQkDeW29FHBoAiKQpxcsAcp11jLhXEuvgqF2WvEWAiCVlxJyruFC6lsrYCNi6htRD3dfnaw__",
        "description":
            "Opening of the New ${"Flowers"} Compound in Sheikh Zayed Area",
        "date": "2/5/2023"
      },
      {
        "image":
            "https://s3-alpha-sig.figma.com/img/94de/0cbf/3e90a09eca6036d75eaa148a4caaab08?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=OC6s4HmXioTVQylDSGsMMSpwVYoaEauEppt52KIzvqR0dhP1nxnRtlsnmWDBhGporNdtww42tCYrmjJvmVIfjLfxLonNO75b5GJpBcLt8CGFXRl8gUeoLsLZ2jAVD-ipyiIk9hOGPx2GKEPGnu31qTlwITBx-Uzm1maR1f6vnwyK~i~t0Lqi4O2VOcTOBtWziqxpux8QhLSXgwwqbciGwSnnqrXm2F1KtD4KHJTc9SPkWSikl~kBBkGP~bMMTOUt7fzwefSwhiXstLsYQkDeW29FHBoAiKQpxcsAcp11jLhXEuvgqF2WvEWAiCVlxJyruFC6lsrYCNi6htRD3dfnaw__",
        "description":
            "Opening of the New ${"Flowers"} Compound in Sheikh Zayed Area",
        "date": "10/6/2023"
      },
      {
        "image":
            "https://s3-alpha-sig.figma.com/img/94de/0cbf/3e90a09eca6036d75eaa148a4caaab08?Expires=1742774400&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=OC6s4HmXioTVQylDSGsMMSpwVYoaEauEppt52KIzvqR0dhP1nxnRtlsnmWDBhGporNdtww42tCYrmjJvmVIfjLfxLonNO75b5GJpBcLt8CGFXRl8gUeoLsLZ2jAVD-ipyiIk9hOGPx2GKEPGnu31qTlwITBx-Uzm1maR1f6vnwyK~i~t0Lqi4O2VOcTOBtWziqxpux8QhLSXgwwqbciGwSnnqrXm2F1KtD4KHJTc9SPkWSikl~kBBkGP~bMMTOUt7fzwefSwhiXstLsYQkDeW29FHBoAiKQpxcsAcp11jLhXEuvgqF2WvEWAiCVlxJyruFC6lsrYCNi6htRD3dfnaw__",
        "description":
            "Opening of the New ${"Flowers"} Compound in Sheikh Zayed Area",
        "date": "15/7/2023"
      },
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
          "News",
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: AppColors.text1,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: NewsWidget(item: newsItems[index]), // Using NewsText widget
          );
        },
      ),
    );
  }
}
