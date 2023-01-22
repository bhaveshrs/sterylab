import 'package:flutter/material.dart';
import 'package:mysterylab/utilitys/appcolor.dart';

// ignore: must_be_immutable
class CommonButtonWidget extends StatelessWidget {
  const CommonButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
    this.alignmentForContent,
    this.buttonColor,
    this.textColor,
    this.border,
    this.fontWeight,
    this.fontSize,
    this.padding,
    this.maxwidth,
    this.width,
    this.textAlign,
    this.buttonPadding,

    //  this.width,
  }) : super(key: key);
  final Function()? onTap;
  final String? text;
  final Color? buttonColor;
  final Color? textColor;
  final Border? border;
  final FontWeight? fontWeight;
  final double? fontSize;
  final EdgeInsets? padding;
  final double? maxwidth;
  final double? width;
  final MainAxisAlignment? alignmentForContent;

  final TextAlign? textAlign;
  final EdgeInsets? buttonPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: buttonPadding ?? EdgeInsets.zero,
        child: Container(
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: border,
            color: buttonColor ?? AppColors.primary,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: alignmentForContent ?? MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(
              //   width: 20,
              // ),

              Expanded(
                flex: 4,
                child: Text(
                  text ?? "",
                  textAlign: textAlign ?? TextAlign.center,
                  style: TextStyle(
                    fontSize: fontSize ?? 18,
                    fontWeight: fontWeight ?? FontWeight.bold,
                    color: textColor ?? AppColors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
