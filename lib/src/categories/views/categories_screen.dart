import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/utils/kstrings.dart';
import 'package:doula/common/widgets/back_button.dart';
import 'package:doula/common/widgets/reusable_text.dart';
import 'package:doula/const/constants.dart';
import 'package:doula/src/categories/controllers/category_notifier.dart';
import 'package:doula/src/categories/models/categories_model.dart';
import 'package:doula/src/onboarding/controllers/onboarding_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        backgroundColor: Kolors.kRed,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: AppBackButton(
            color: Kolors.kWhite,
            size: 30,
            onTap: () {
              GoRouter.of(context).go('/home');
            },
          ),
        ),
        title: ReusableText(
          text: AppText.kCategories,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Kolors.kWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final url = category.imageUrl;
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 3),
            leading: CircleAvatar(
              backgroundColor: Kolors.kGrayLight,
              radius: 18,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.network(url),
              ),
            ),
            title: ReusableText(
              text: category.title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Kolors.kGray,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Kolors.kGray),
            onTap: () {
              // Add navigation logic when a category is tapped
              context.read<CategoryNotifier>().setCategory(category.title, category.id);
              context.push("/category", extra: category.title);

            },
          );
        },
      ),
    );
  }
}