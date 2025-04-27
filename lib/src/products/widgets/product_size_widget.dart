import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:doula/src/products/controllers/colors_sizes_nortifile.dart';
import 'package:doula/common/utils/kcolors.dart';

class ProductSizeWidget extends StatelessWidget {
  const ProductSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSizeNortifile>(
      builder: (BuildContext context, value, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(value.size.length, (index) {
            context.read<ColorSizeNortifile>().setSize(value.size[index]);
            return GestureDetector(
              onTap: () {
                context.read<ColorSizeNortifile>().setSize(value.size[index]);
                // context.read<ColorSizeNortifile>().setColor(value.color[index]);
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Kolors.kPrimary,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Kolors.kRed, width: 1),
                ),
                child: Center(
                  child: Text(
                    value.size[index],
                    style: TextStyle(color: Kolors.kWhite),
                  ),
                ),
              ),
            );
          }
          ),
        );
      },
    );
  }
}
