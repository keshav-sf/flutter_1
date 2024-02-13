import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/src/base/dependencyinjection/locator.dart';
import 'package:flutter_boilerplate/src/base/utils/localization/localization.dart';
import 'package:flutter_boilerplate/src/base/utils/navigation_utils.dart';
import 'package:flutter_boilerplate/src/base/utils/progress_dialog_utils.dart';

class MaterialErrorDialog extends StatelessWidget {
  final String message;
  final String? okTitle;
  final Function()? okFunction;
  final bool isCancelEnable;

  const MaterialErrorDialog(
      {Key? key,
      required this.message,
      this.okTitle,
      this.okFunction,
      this.isCancelEnable = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(Localization.of().appName),
      content: Text(message),
      actions: isCancelEnable
          ? [_getOkAction(), _getCancelAction()]
          : [_getOkAction()],
    );
  }

  _getOkAction() {
    return TextButton(
      child: Text(okTitle ?? Localization.of().ok),
      onPressed: () {
        locator<NavigationUtils>().pop();
        ProgressDialogUtils.dismissProgressDialog();

        if (okFunction != null) {
          okFunction!();
        }
      },
    );
  }

  _getCancelAction() {
    return TextButton(
      child: Text(Localization.of().cancel),
      onPressed: () {
        locator<NavigationUtils>().pop();
        ProgressDialogUtils.dismissProgressDialog();
      },
    );
  }
}
