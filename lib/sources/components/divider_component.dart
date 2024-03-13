import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DividerComponent extends StatelessWidget {
  EdgeInsetsGeometry? margin;
  double height;

  DividerComponent({
    super.key,
    this.height = 2,
    this.margin
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: double.infinity,
      height: height,
      color: const Color(0xFFD9D9D9),
    );
  }

}