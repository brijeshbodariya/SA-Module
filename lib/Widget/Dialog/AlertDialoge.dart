import 'package:flutter/material.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';
import 'package:smartkit/Widget/Dialog/DialogButton.dart';

import 'Alert.dart';
import 'alert_style.dart';
import 'constants.dart';

class WrAlertDialog extends StatefulWidget {
  WrAlertDialog({Key key}) : super(key: key);

  @override
  _WrAlertDialogState createState() => _WrAlertDialogState();
}

class _WrAlertDialogState extends State<WrAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: SmartKitAppbar(
            title: "Alert Dialog",
          )),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              AlertUi(
                iconTitle: "SA",
                title: "Simple Alert",
                ontap: () {
                  print("tap---/-");
                  _showSimpleDialog();
                },
                color: Color(0xFFF5F9F9),
                iconbg: Color(0xFFCDE4E4),
                textcolor: Color(0xFF469695),
              ),
              AlertUi(
                iconTitle: "CD",
                title: "Confirmation Dialog",
                ontap: () {
                  print("tap---/-");
                  _showDialog();
                },
                color: Color(0xFFFEF4F4),
                iconbg: Color(0xFFFCE0DB),
                textcolor: Color(0xFFFD3627),
              ),
              AlertUi(
                iconTitle: "BA",
                title: "Basic Alert",
                ontap: () {
                  print("tap---/-");
                  _onBasicAlertPressed(context);
                },
                color: Color(0xFFFDF9FB),
                iconbg: Color(0xFFFBD7ED),
                textcolor: Color(0xFFC93F8D),
              ),
              AlertUi(
                iconTitle: "AW ",
                title: "Alert with Button",
                ontap: () {
                  print("tap---/-");
                  _onAlertButtonPressed(context);
                },
                color: Color(0xFFF6F5FB),
                iconbg: Color(0xFFE8E5F3),
                textcolor: Color(0xFF3C326F),
              ),
              AlertUi(
                iconTitle: "AG",
                title: "Alert Gradient Buttons",
                ontap: () {
                  print("tap---/-");
                  _onAlertButtonsPressed(context);
                },
                color: Color(0xFFF5F9F9),
                iconbg: Color(0xFFCDE4E4),
                textcolor: Color(0xFF469695),
              ),
              AlertUi(
                iconTitle: "AW",
                title: "Alert with Style",
                ontap: () {
                  print("tap---/-");
                  _onAlertWithStylePressed(context);
                },
                color: Color(0xFFFEF4F4),
                iconbg: Color(0xFFFCE0DB),
                textcolor: Color(0xFFFD3627),
              ),
              AlertUi(
                iconTitle: "AC",
                title: "Alert Custom Image",
                ontap: () {
                  print("tap---/-");
                  _onBasicAlertPressed(context);
                },
                color: Color(0xFFFDF9FB),
                iconbg: Color(0xFFFBD7ED),
                textcolor: Color(0xFFC93F8D),
              ),
            ],
          )),
    );
  }

  void _showSimpleDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Are you sure you want to delete?"),
          content: new Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
            ),
            new TextButton(
              child: new Text("CANCEL"),
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop('dialog');
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Use Google's Location Service?"),
          content: new Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tempus sit amet lectus sed tempor. Curabitur convallis libero eget libero faucibus imperdiet. Mauris semper ullamcorper nisl eget aliquet. Fusce vehicula, felis a lobortis fringilla, odio elit aliquam est, ac egestas neque est eu risus"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new TextButton(
              child: new Text("DISAGREE"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new TextButton(
              child: new Text("AGREE"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  _onBasicAlertPressed(context) {
    Alert(context: context, title: "RFLUTTER ALERT", desc: "Flutter is more awesome with RFlutter Alert.").show();
  }

  // Alert with single button.
  _onAlertButtonPressed(context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
          width: 120,
          color: Color.fromRGBO(0, 179, 134, 1.0),
        )
      ],
    ).show();
  }

// Alert with multiple and custom buttons
  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "FLAT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "GRADIENT",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
          gradient: LinearGradient(colors: [Color.fromRGBO(116, 116, 191, 1.0), Color.fromRGBO(52, 138, 199, 1.0)]),
        )
      ],
    ).show();
  }

// Advanced using of alerts
  _onAlertWithStylePressed(context) {
    // Reusable alert style
    var alertStyle = AlertStyle(
      animationType: AnimationType.fromTop,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.bold),
      animationDuration: Duration(milliseconds: 400),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    );

    // Alert dialog using custom alert style
    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.info,
      title: "RFLUTTER ALERT",
      desc: "Flutter is more awesome with RFlutter Alert.",
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }
}

class AlertUi extends StatelessWidget {
  const AlertUi({
    Key key,
    this.iconTitle,
    this.title,
    this.color,
    this.iconbg,
    this.textcolor,
    this.ontap,
  }) : super(key: key);

  final String iconTitle;
  final String title;
  final Color color;
  final Color iconbg;
  final Color textcolor;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width / 1,
        height: width / 3.8,
        decoration: BoxDecoration(
            color: color,
            // Color(0xFFF5F9F9),
            borderRadius: BorderRadius.circular(10.0)),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: ListTile(
            leading: Container(
              child: Center(
                child: Text(
                  "$iconTitle",
                  style: TextStyle(
                    fontSize: width / 18,
                    // fontWeight: FontWeight.bold,
                    color: textcolor,
                  ),
                ),
              ),
              width: width / 6.5,
              height: width / 1,
              decoration: BoxDecoration(
                color: iconbg,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            title: Text(
              "$title",
              style: TextStyle(
                fontSize: width / 18,
                // fontWeight: FontWeight.bold,
                color: textcolor,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: width / 20, color: textcolor),
          ),
        ),
      ),
    );
  }
}
