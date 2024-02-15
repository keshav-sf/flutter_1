import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/fontsize_constant.dart';

class PrimaryTextButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color borderColor;
  final double borderRadius;
  final Color textColor;
  final FontWeight textWeight;
  final double textSize;
  final TextAlign textAlign;
  final Function()? onButtonClick;
  final double? width;
  final double? height;
  final double verticalPadding;
  final double horizontalPadding;
  final IconData? buttonIcon;
  final Color? iconColor;

  const PrimaryTextButton({
    Key? key,
    required this.buttonText,
    this.buttonColor = Colors.white,
    this.borderColor = Colors.white,
    this.borderRadius = 0,
    this.textColor = primaryColor,
    this.textWeight = fontWeightRegular,
    this.textSize = fontSize14,
    this.textAlign = TextAlign.start,
    this.width,
    this.height,
    required this.onButtonClick,
    this.verticalPadding = 0,
    this.horizontalPadding = 0,
    this.buttonIcon,
    this.iconColor = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onButtonClick,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
            vertical: verticalPadding, horizontal: horizontalPadding),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        backgroundColor: buttonColor,
      ),
      child: buttonIcon == null
          ? Text(
              buttonText,
              textAlign: textAlign,
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
                fontWeight: textWeight,
                height: 1.4,
              ),
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  buttonText,
                  textAlign: textAlign,
                  style: TextStyle(
                    color: textColor,
                    fontSize: textSize,
                    fontWeight: textWeight,
                    height: 1.4,
                  ),
                ),
                const Spacer(),
                Icon(
                  buttonIcon,
                  color: iconColor,
                ),
              ],
            ),
    );
  }
}
