import 'package:cached_network_image/cached_network_image.dart';
import 'package:doula/common/services/storage.dart';
import 'package:doula/common/utils/app_routes.dart';
import 'package:doula/common/utils/enums.dart';
import 'package:doula/common/utils/kcolors.dart';
import 'package:doula/common/widgets/app_style.dart';
import 'package:doula/common/widgets/reusable_text.dart';
import 'package:doula/src/products/controllers/product_notifile.dart';
import 'package:doula/src/products/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';


class StaggeredTileWidget extends StatelessWidget {
  const StaggeredTileWidget({
    super.key,
    required this.i,
    required this.product,
    this.onTap,
  });

  final int i;
  final Products product;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String? accessToken = Storage().getString('accessToken');
    return GestureDetector(
      onTap: () {
        print("accessToken");
        context.read<ProductNotifier>().setProduct(product);
        context.push('/product/${product.id}',
            extra: {'product': product, 'accessToken': accessToken});
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Kolors.kRed,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: i % 2 == 0 ? 163.h : 180.h,
                color: Kolors.kPrimary,
                child: Stack(
                  children: [
                    CachedNetworkImage(
                      height: i % 2 == 0 ? 163.h : 180.h,
                      fit: BoxFit.cover,
                      imageUrl: product.imageUrls[0],
                    ),

                    ///TODO: handle favorites
                    Positioned(
                      right: 10.h,
                      top: 10.h,
                      child: GestureDetector(
                        onTap: onTap,
                        child: const CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: Kolors.kOffWhite,
                          child: Icon(
                            AntDesign.heart,
                            color: Kolors.kGray,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        product.title,
                        overflow: TextOverflow.ellipsis,
                        style: appStyle(13, Kolors.kWhite, FontWeight.w600),
                      ),
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
                          text: product.ratings.toStringAsFixed(1),
                          style: appStyle(13, Kolors.kWhite, FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: ReusableText(
                  text: '\$ ${product.price.toStringAsFixed(2)}',
                  style: appStyle(17, Kolors.kWhite, FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
