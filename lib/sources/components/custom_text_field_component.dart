import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomTextFieldComponent extends StatelessWidget {
  Widget? label;
  TextEditingController? controller;
  double? height;
  double? width;
  double borderWidth;
  double borderRadius;
  Color? backgroundColor;
  String? hintText;
  TextAlign textAlign;
  bool readOnly;
  void Function()? onTap;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  bool errorText;
  double fontSize;

  CustomTextFieldComponent({
    super.key,
    this.label,
    this.controller,
    this.height,
    this.width,
    this.borderWidth = 2,
    this.borderRadius = 6,
    this.backgroundColor,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.onTap,
    this.suffixIcon,
    this.validator,
    this.errorText = true,
    this.fontSize = 12
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (label != null) Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: label!,
        ),
        SizedBox(
          height: height,
          width: width,
          child: TextFormField(
            controller: controller,
            validator: validator,
            textAlign: textAlign,
            readOnly: readOnly,
            onTap: onTap,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: fontSize
            ),
            decoration: InputDecoration(
              suffixIcon: suffixIcon != null
                ? Container(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                    child: suffixIcon,
                  )
                : null,
              filled: backgroundColor != null,
              fillColor: backgroundColor,
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: borderWidth > 0
                  ? BorderSide(
                      color: const Color(0xFFD3D3D3),
                      width: borderWidth
                    )
                  : BorderSide.none
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: borderWidth > 0
                  ? BorderSide(
                      color: const Color(0xFFD3D3D3),
                      width: borderWidth
                    )
                  : BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                  width: borderWidth
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              hintText: hintText,
              hintStyle: GoogleFonts.inter(
                color: const Color(0xFFD9D9D9),
              ),
              errorStyle: !errorText
                ? const TextStyle(
                    color: Colors.transparent,
                    fontSize: 0
                  )
                : null
            ),
          )
        )  
      ],
    );
  }

}