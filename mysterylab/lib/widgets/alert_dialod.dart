import 'package:flutter/material.dart';
import 'package:mysterylab/utilitys/appcolor.dart';
import 'package:mysterylab/widgets/common_button_widget.dart';

class AlertDialogBoxWidget extends StatelessWidget {
  const AlertDialogBoxWidget(
      {Key? key,
      this.backgroundcolor,
      this.ontapFirst,
      this.alertMessage,
      this.buttonTextFirst,
      this.isNeedTwoButtons = false,
      this.isNeedTitleIcon,
      this.alertMessagecolor,
      this.titleTextColor,
      this.iconColor,
      this.title,
      this.isTextField = false,
      this.isNeedImage = false,
      this.hintText,
      this.ontapSecond,
      this.buttonTextSecond,
      this.image,
      this.fontSize,
      this.buttonColorFirst,
      this.buttonColorSecond,
      this.inputBorder,
      this.buttonWidth,
      this.alertDailogRadius,
      this.borderColor,
      this.maxLine,
      this.contentFontSize,
   
      this.isNeedCrossButton = true,
      this.radioButton = false,
      this.buttonFirstInnerPadding,
      this.buttonSecondInnerPadding,
      this.alertmessagepadding})
      : super(key: key);
  final Function()? ontapFirst;
  final Function()? ontapSecond;
  final String? alertMessage;
  final String? buttonTextFirst;
  final String? buttonTextSecond;

  final String? title;
  final double? fontSize;
  final double? contentFontSize;
  final bool isNeedTwoButtons;
  final bool isNeedCrossButton;
  final bool? isNeedTitleIcon;
  final Color? titleTextColor;
  final Color? alertMessagecolor;
  final Color? iconColor;
  final bool isTextField;
  final String? image;
  final bool isNeedImage;
  final String? hintText;

  final Color? buttonColorFirst;
  final Color? buttonColorSecond;

  final int? maxLine;
  final double? buttonWidth;
  final double? alertDailogRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? alertmessagepadding;

  final bool radioButton;
  final EdgeInsets? buttonFirstInnerPadding;
  final EdgeInsets? buttonSecondInnerPadding;

  final Color? backgroundcolor;

  final InputBorder? inputBorder;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(alertDailogRadius ?? 15),
          ),
          borderSide: BorderSide(color: borderColor ?? Colors.black)),
      backgroundColor: backgroundcolor ?? AppColors.background,
      title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: titleTextColor ?? AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              // const SizedBox(
              //   width: 4,
              // ),
              // if (isNeedTitleIcon ?? false)
              //   GestureDetector(
              //       onTap: () {},
              //       child: icon ??
              //           Icon(
              //             Icons.front_hand_rounded,
              //             color: iconColor,
              //             size: 25,
              //           )),
            ],
          ),
        ),
        if (!isNeedCrossButton)
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.close),
          ),
      ]),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (alertMessage != null)
              Padding(
                padding: alertmessagepadding ?? const EdgeInsets.all(10),
                child: Text(
                  alertMessage!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: contentFontSize ?? 16,
                  ),
                ),
              ),
          ],
        ),
      ),
      actions: [
        if (isNeedTwoButtons == true &&
            ontapFirst != null &&
            ontapSecond != null) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CommonButtonWidget(
                    buttonColor: buttonColorFirst ?? AppColors.primary,
                    onTap: ontapFirst!,
                    text: buttonTextFirst,
                    padding: buttonFirstInnerPadding,
                    fontSize: fontSize ?? 18,
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: CommonButtonWidget(
                    buttonColor: buttonColorSecond,
                    onTap: ontapSecond!,
                    text: buttonTextSecond,
                    padding: buttonSecondInnerPadding,
                    fontSize: fontSize ?? 18,
                  ),
                )
              ],
            ),
          ),
        ] else if (ontapFirst != null)
          Center(
            child: CommonButtonWidget(
              buttonPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              onTap: ontapFirst!,
              text: buttonTextFirst,
              fontSize: fontSize ?? 18,
              maxwidth: buttonWidth,
            ),
          ),
      ],
    );
  }
}
