import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color color;
  final double elevation;
  final BorderRadiusGeometry borderRadius;
  final Widget child;

  const CustomCard({
    Key? key,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(16),
    this.color = Colors.white,
    this.elevation = 4.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(8.0)),
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin,
      color: color,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
