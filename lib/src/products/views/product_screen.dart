import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/widgets/app_style.dart';
import 'package:doula/common/widgets/back_button.dart';
import 'package:doula/common/widgets/reusable_text.dart';
import 'package:doula/const/constants.dart';
import 'package:doula/src/products/controllers/product_notifile.dart';
import 'package:doula/src/products/widgets/expan_text.dart';
import 'package:doula/src/products/widgets/similar_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
  


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    print(context.read<ProductNotifier>().product!.title);
    return Consumer<ProductNotifier>(
      builder: (context, productNotifier, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 320.h,
                collapsedHeight: 65.h,
                backgroundColor: Kolors.kWhite,
                floating: false,
                pinned: true,
                leading: AppBackButton(),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: CircleAvatar(
                        backgroundColor: Kolors.kSecondaryLight,
                        child: Icon(
                          AntDesign.heart,
                          color: Kolors.kRed,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: ImageSlideshow(
                    width: ScreenUtil().screenWidth,
                    height: 200, // Fixed height to match parent SizedBox
                    initialPage: 0,
                    indicatorColor: Kolors.kRed,
                    indicatorBackgroundColor: Kolors.kGrayLight,
                    autoPlayInterval: 15000,
                    isLoop:
                        productNotifier.product!.imageUrls.length > 1
                            ? true
                            : false,
                    children: List.generate(
                      productNotifier.product!.imageUrls.length,
                      (index) {
                        return CachedNetworkImage(
                          imageUrl: productNotifier.product!.imageUrls[index],
                          fit: BoxFit.cover,
                          placeholder: placeholder,
                          errorWidget: errorWidget,
                          height: 400.h,
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableText(
                        text:
                            productNotifier.product!.clothesType.toUpperCase(),
                        style: appStyle(16, Kolors.kGray, FontWeight.w600),
                      ),
                      Row(
                        children: [
                          const Icon(
                            AntDesign.star,
                            color: Kolors.kGold,
                            size: 14,
                          ),
                          SizedBox(width: 5.w),
                          ReusableText(
                            text: productNotifier.product!.ratings
                                .toStringAsFixed(1),
                            style: appStyle(
                              13,
                              Kolors.kGray,
                              FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: "Price",
                    style: appStyle(16, Kolors.kDark, FontWeight.w600),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text:
                        '\$ ${productNotifier.product!.price.toStringAsFixed(2)}',
                    style: appStyle(17, Kolors.kGray, FontWeight.w500),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: productNotifier.product!.title,
                    style: appStyle(16, Kolors.kDark, FontWeight.w600),
                  ),
                ),
              ),
             
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: ExpanText(text: productNotifier.product!.description,
                      textStyle: appStyle(13, Kolors.kGray, FontWeight.w400),
                      expandedLines: 1000,
                      collapsedLines: 2,
                      toggleStyle: appStyle(
                        13,
                        Kolors.kRed,
                        FontWeight.w400,
                      ),
                      padding: EdgeInsets.only(bottom: 4.h)),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w),
                  child: Divider(
                    color: Kolors.kGrayLight,
                    thickness: 0.5.h,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5.h,
                ),
              ),
              
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: "Select Size",
                    style: appStyle(16, Kolors.kDark, FontWeight.w600),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: productNotifier.product!.sizes.toString(),
                    style: appStyle(16, Kolors.kGray, FontWeight.w500),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5.h,
                ),
              ),  
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: "Select Color",
                    style: appStyle(16, Kolors.kDark, FontWeight.w600),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: productNotifier.product!.colors.toString(),
                    style: appStyle(16, Kolors.kGray, FontWeight.w500),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5.h,
                ),
              ),  
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: ReusableText(
                    text: "Similar Products",
                    style: appStyle(16, Kolors.kDark, FontWeight.w600),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: SimilarProducts(
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 5.h,
                ),
              ),  

            ],
          ),
        );
      },
    );
  }
}
