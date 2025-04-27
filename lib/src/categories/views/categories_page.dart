import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/widgets/app_style.dart';
import 'package:doula/common/widgets/back_button.dart';
import 'package:doula/common/widgets/reusable_text.dart';
import 'package:doula/const/constants.dart';
import 'package:doula/src/categories/controllers/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryNotifier = context.watch<CategoryNotifier>();

    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        leading: AppBackButton(
          color: Kolors.kWhite,
          size: 30,
          
        ),
        // ignore: avoid_print
        elevation: 0,
        title: ReusableText(
          text: categoryNotifier.category ?? 'categories',
          
          style: appStyle(16, Kolors.kWhite, FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Kolors.kRed,
      ),
      body: Container(
        
        padding: const EdgeInsets.all(16),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              text: 'Categories',
              style: appStyle(20, Kolors.kGray, FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: categoryNotifier.category.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(categoryNotifier.category[index]),
                    onTap: () {
                      // Handle category selection
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
