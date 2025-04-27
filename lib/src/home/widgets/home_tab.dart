
import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/widgets/app_style.dart';
import 'package:doula/common/widgets/tab_widget.dart';
import 'package:doula/src/home/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doula/src/home/widgets/home_header.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({super.key, required TabController tabController})
      : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      child: TabBar(
        controller: _tabController,
        indicator: BoxDecoration(
            color: Kolors.kRed, borderRadius: BorderRadius.circular(25)),
        labelPadding: EdgeInsets.zero,
        labelColor: Kolors.kWhite,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        labelStyle: appStyle(11, Kolors.kPrimary, FontWeight.w600),
        unselectedLabelStyle: appStyle(11, Kolors.kGray, FontWeight.normal),
        tabs: List.generate(
            homeTaps.length,
            (index) => Tab(
                  child: TabWidget(
                    text: homeTaps[index],
                  ),
                )),
      ),
    );
  }
}
