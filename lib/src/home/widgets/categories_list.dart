import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/widgets/app_style.dart';
import 'package:doula/common/widgets/reusable_text.dart';
import 'package:doula/const/constants.dart';
import 'package:doula/src/categories/controllers/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doula/common/utils/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';




class HomeCategoriesList extends StatelessWidget {
  const HomeCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 80.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(categories.length, (index) {
              final category = categories[index];
            return GestureDetector(
              onTap: () {
                // Add navigation logic when a category is tapped
              context.read<CategoryNotifier>().setCategory(category.title, category.id);
              context.push("/category", extra: category.title);
                
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Kolors.kGrayLight,
                    radius: 20.r,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: SvgPicture.network(categories[index].imageUrl),
                    ),
                  ),
                  const SizedBox(height: 5),
                  ReusableText(
                    text: categories[index].title,
                    style: appStyle(10, Kolors.kGray, FontWeight.w500),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
