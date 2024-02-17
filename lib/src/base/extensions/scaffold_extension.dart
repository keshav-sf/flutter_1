import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/widgets/single_text_widget.dart';

import '../utils/constants/color_constant.dart';
import '../utils/constants/fontsize_constant.dart';

extension ScaffoldExtension on Widget {
  Scaffold authContainerScaffold({required BuildContext context}) {
    return Scaffold(
      body: SafeArea(
        child: this,
      ),
    );
  }

  Scaffold dashboardContainerScaffold({
    required BuildContext context,
    title,
    bottomNavigationIcon1,
    bottomNavigationIcon2,
    bottomNavigationiconColor = primaryColor,
  }) {
    return Scaffold(
      appBar: AppBar(
        title: _addAppBarTitle(title: title),
        automaticallyImplyLeading: false,
        backgroundColor: primaryColor.withOpacity(0.05),
      ),
      bottomNavigationBar: _addAppBarBottomNavigation(
        icon1Name: bottomNavigationIcon1,
        icon2Name: bottomNavigationIcon2,
        iconColor: bottomNavigationiconColor,
      ),
      body: SafeArea(
        child: this,
      ),
    );
  }

  Dialog dialogContainer({double height = 350}) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 20.0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(20.0),
        child: this,
      ),
    );
  }
}

Widget _addAppBarBottomNavigation({
  icon1Name,
  iconColor = primaryColor,
  icon2Name,
}) {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
          icon: Icon(
            icon1Name,
            color: iconColor,
            size: 30,
          ),
          label: "●"),
      BottomNavigationBarItem(
          icon: Icon(
            icon2Name,
            color: iconColor,
            size: 30,
          ),
          label: "")
    ],
  );
}

Widget _addAppBarTitle({title}) {
  return SingleTextWidget(
    text: "Welcome $title",
    textWeight: fontWeightMedium,
    textSize: fontSize22,
    textColor: primaryColor,
  );
}
