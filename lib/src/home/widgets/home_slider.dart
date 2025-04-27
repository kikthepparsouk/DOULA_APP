import 'package:cached_network_image/cached_network_image.dart';
import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/utils/kstrings.dart';
import 'package:doula/common/widgets/app_style.dart';
import 'package:doula/common/widgets/custom_button.dart';
import 'package:doula/common/widgets/reusable_text.dart';
import 'package:doula/const/constants.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: kRadiusAll,
      child: Stack(
        children: [
          SizedBox(
            width: ScreenUtil().screenWidth,
            height:
                ScreenUtil().screenWidth *
                0.4, // Adjusted height to maintain aspect ratio
            child: ImageSlideshow(
              width: ScreenUtil().screenWidth,
              height: 200, // Fixed height to match parent SizedBox
              initialPage: 0,
              indicatorColor: Kolors.kRed,
              indicatorBackgroundColor: Kolors.kGrayLight,
              autoPlayInterval: 5000,
              isLoop: true,
              children: [
                for (var image in images)
                  CachedNetworkImage(
                    placeholder: placeholder,
                    errorWidget: errorWidget,
                    imageUrl: image, // Changed from images[i] to image
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200,
                  ),
              ],
              onPageChanged: (value) {
                // Handle page change if needed
                print("Page changed to: $value");
              },
            ),
          ),
          Positioned(
            child: SizedBox(
              width: ScreenUtil().screenWidth,
              height:
                  ScreenUtil().screenWidth *
                  0.4, // Adjusted height to maintain aspect ratio
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: AppText.kCollection,
                      style: appStyle(20, Kolors.kRed, FontWeight.bold),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      'Dscount up to 50%\non selected items',
                      style: appStyle(13, Kolors.kWhite, FontWeight.w500),
                    ),
                    SizedBox(height: 4.h),
                    CustomButton(
                      text: AppText.kShopNow,
                      onTap: () {
                        // Handle button tap
                      },
                      btnHieght: 30.h,
                      radius: 12,
                      btnWidth: ScreenUtil().screenWidth * 0.3,
                      btnColor: Kolors.kRed,
                      // gradient: kGradient,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ລາຍຊື່ຮູບພາບ (ສາມາດເປັນ URL ຫຼື path ໃນ assets)
final List<String> images = [
  'https://t3.ftcdn.net/jpg/03/20/68/66/240_F_320686681_Ur6vdYQgDC9WiijiVfxlRyQffxOgfeFz.jpg',
  'https://t4.ftcdn.net/jpg/03/46/51/19/240_F_346511926_B0dlruARI2rtWSpntNYRnIcq38xugKsh.jpg',
  'https://t4.ftcdn.net/jpg/02/83/68/41/240_F_283684148_VUiF5Ei9Uca6ResgLzeORpIu6vF1xsHJ.jpg',
  'assets/images/placeholder.webp',
];


