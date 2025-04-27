import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/utils/kstrings.dart';
import 'package:doula/common/widgets/app_style.dart';
import 'package:doula/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          text: AppText.kCategories,
          style: appStyle(13, Kolors.kDark, FontWeight.w600),
        ),
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () {
            // Add your onTap functionality here
            GoRouter.of(context).go('/categories');
          },
          child: ReusableText(
            text: AppText.kSeeAll,
            style: appStyle(13, Kolors.kGray, FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
