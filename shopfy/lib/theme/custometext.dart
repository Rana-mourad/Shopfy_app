import 'package:flutter/material.dart';
import 'package:shopfy/theme/Appcolor.dart';

class CustomText extends StatelessWidget {
  CustomText({
    Key? key,
    required this.text,
    this.color = AppColor.fontColor,
    this.fontWeight,
    this.fontSize,
    this.maxLines,
    this.fontFamily,
    this.textAlign = TextAlign.center,
  }) : super(key: key);
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final int? maxLines;
  final TextAlign? textAlign;
  final String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: fontFamily,
        overflow: TextOverflow.ellipsis,
      ),
      textAlign: textAlign,
      maxLines: maxLines ?? 100,
    );
  }
}
