import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/utils/constants/color_constant.dart';

import '../base/utils/constants/fontsize_constant.dart';

class SingleTextWidget extends StatelessWidget {
  final String text;
  final Color textColor;
  final FontWeight textWeight;
  final double textSize;
  final TextAlign textAlign;

  const SingleTextWidget({
    Key? key,
    required this.text,
    this.textColor = primaryColor,
    this.textWeight = fontWeightRegular,
    this.textSize = fontSize14,
    this.textAlign = TextAlign.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getText(text: text);
  }

  Widget _getText({
    required String text,
  }) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor,
        fontSize: textSize,
        fontWeight: textWeight,
        height: 1.4,
      ),
    );
  }
}
