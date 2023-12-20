import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:shopfy/theme/Appcolor.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    required this.imageSvgPath,
    this.validator,
    this.colorOfIcon,
    this.onFieldSubmitted,
    this.obscureText = false,
  }) : super(key: key);
  final String? labelText;
  final TextEditingController? controller;
  final String? imageSvgPath;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String? hintText;
  final Color? colorOfIcon;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        errorStyle: TextStyle(
          color: Colors.red,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 14,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.fontGrayColor,
        ),
        prefixIcon: imageSvgPath == null
            ? null
            : Container(
                padding: EdgeInsets.all(10),
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  imageSvgPath!,
                  fit: BoxFit.scaleDown,
                  color: colorOfIcon,
                ),
              ),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
