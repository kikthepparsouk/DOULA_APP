import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/widgets/app_style.dart';
import 'package:doula/common/widgets/reusable_text.dart';
import 'package:doula/src/home/widgets/notifications_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Kolors.kRed,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ReusableText(
              text: 'Location',
              style: appStyle(13, Kolors.kGrayLight, FontWeight.normal),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(Ionicons.location, color: Kolors.kWhite, size: 13),
              SizedBox(width: ScreenUtil().screenWidth * 0.01),

              ReusableText(
                text: 'Please select a Location',
                style: appStyle(13, Kolors.kWhite, FontWeight.normal),
              ),
            ],
          ),
        ],
      ),
      centerTitle: true,
      actions: [NotificationsWidget()],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(55.h),
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).go('/notifications');
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.h),
            child: Padding(
              padding:  EdgeInsets.only(left: 6.w,bottom: 7.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40.h,
                    width: ScreenUtil().screenWidth - 80,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Kolors.kOffWhite),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Icon(Ionicons.search, color: Kolors.kWhite),
                          SizedBox(width: 10.w),
                          ReusableText(
                            text: 'Search for a service',
                            style: appStyle(
                              13,
                              Kolors.kWhite,
                              FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: Kolors.kWhite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      FontAwesome.sliders,
                      color: Kolors.kRed,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
