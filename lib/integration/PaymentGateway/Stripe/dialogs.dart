import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  /// Show info dialogs with OK button
  static showInfoDialog(BuildContext context, String message,
      {Function onPressed, bool isCancelable = true}) async {
    String btnText = "Ok";
    String title = "SmartKit";

    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
            onPressed: onPressed ??
                () {
                  Navigator.pop(context);
                },
            child: Text(btnText)),
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: isCancelable,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  
  static showDialogWithTwoOptions(
      BuildContext context, String message, String positiveButtonText,
      {VoidCallback positiveButtonCallBack, bool isCancelable = true}) async {
    String btnText = "Cancel";
    String title = "SmartKit";

    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
            onPressed: positiveButtonCallBack, child: Text(positiveButtonText)),
        CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(btnText)),
      ],
    );

    showDialog(
      context: context,
      barrierDismissible: isCancelable,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
