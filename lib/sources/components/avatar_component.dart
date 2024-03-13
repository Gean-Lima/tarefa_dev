import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AvatarComponent extends StatelessWidget {
  String image;

  AvatarComponent({
    super.key,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.asset(
        image,
        width: 50,
        height: 50,
      )
    );
  }

}