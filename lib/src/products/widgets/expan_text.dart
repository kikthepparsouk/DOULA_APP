import 'package:doula/common/utils/kcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExpanText extends StatefulWidget {
  const ExpanText({
    super.key,
    required this.text,
    this.collapsedLines = 3,
    this.expandedLines = 1000, // Large number to show all text
    this.textStyle,
    this.toggleStyle,
    this.padding,
  });

  final String text;
  final int collapsedLines;
  final int expandedLines;
  final TextStyle? textStyle;
  final TextStyle? toggleStyle;
  final EdgeInsetsGeometry? padding;

  @override
  State<ExpanText> createState() => _ExpanTextState();
}

class _ExpanTextState extends State<ExpanText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = TextStyle(
      color: Kolors.kGray,
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
    );

    final defaultToggleStyle = TextStyle(
      color: Kolors.kRed,
      fontSize: 13.sp,
      fontWeight: FontWeight.w400,
    );

    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            textAlign: TextAlign.justify,
            widget.text,
            maxLines: _isExpanded ? widget.expandedLines : widget.collapsedLines,
            overflow: TextOverflow.ellipsis,
            style: widget.textStyle ?? defaultTextStyle,
          ),
          // SizedBox(height: 5.h),
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Text(
              _isExpanded ? "Show less" : "Show more...",
              style: widget.toggleStyle ?? defaultToggleStyle,
            ),
          ),
        ],
      ),
    );
  }
}