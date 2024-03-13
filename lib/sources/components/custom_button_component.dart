import 'package:flutter/material.dart';
import 'package:tarefa_dev/sources/services/colors_app.dart';

// ignore: must_be_immutable
class CustomButtonComponent extends StatelessWidget {
  void Function()? onPressed;
  Widget? child;
  double? height;
  double? width;
  Color? backgroundColor;

  CustomButtonComponent({
    super.key,
    required this.onPressed,
    required this.child,
    this.height,
    this.width,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          backgroundColor: backgroundColor ?? ColorsApp.primary
        ),
        onPressed: onPressed,
        child: child
      ),
    );
  }
  
}