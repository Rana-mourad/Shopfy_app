import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopfy/theme/Appcolor.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.text,
    this.buttonColor = AppColor.primaryColor,
    this.iconColor = AppColor.primaryColor,
    this.shadowColor = AppColor.primaryColor,
    this.onTap,
    this.iconImageSvgPath,
    this.height = 46,
    this.width,
    this.fontColor = Colors.white,
    this.colorOfBackgroundIcon = Colors.white,
    Key? key,
  }) : super(key: key);
  final String text;
  final Color buttonColor;
  final void Function()? onTap;
  final String? iconImageSvgPath;
  final Color iconColor;
  final Color shadowColor;
  final double height;
  final Color fontColor;
  final Color colorOfBackgroundIcon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? Get.width * 0.9,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.3),
              blurRadius: 5,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: fontColor,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: colorOfBackgroundIcon,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  iconImageSvgPath ?? "assets/images/arrow_right_s.svg",
                  height: 18,
                  width: 18,
                  fit: BoxFit.scaleDown,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
