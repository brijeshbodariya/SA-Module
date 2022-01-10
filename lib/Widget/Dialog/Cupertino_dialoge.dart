import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/SmartkitScreen/Screen/SmartKitAppbar.dart';

class CupertinoDialog extends StatefulWidget {
  CupertinoDialog({Key key}) : super(key: key);

  @override
  _CupertinoDialogState createState() => _CupertinoDialogState();
}

class _CupertinoDialogState extends State<CupertinoDialog> {
  String strs;

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
                iconTitle: "SD",
                title: "Show Dialog",
                ontap: () {
                  showAlert();
                },
                color: Color(0xFFF5F9F9),
                iconbg: Color(0xFFCDE4E4),
                textcolor: Color(0xFF469695),
              ),
              AlertUi(
                iconTitle: "SA",
                title: "Show Action Sheet",
                ontap: () {
                  showActionsheet();
                },
                color: Color(0xFFFEF4F4),
                iconbg: Color(0xFFFCE0DB),
                textcolor: Color(0xFFFD3627),
              ),
              AlertUi(
                iconTitle: "SM",
                title: "Show Modal Popup",
                ontap: () {
                  showModal();
                },
                color: Color(0xFFFDF9FB),
                iconbg: Color(0xFFFBD7ED),
                textcolor: Color(0xFFC93F8D),
              ),
            ],
          )),
    );
  }

  void showAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text("Alert title"),
            content: new Text("Alert content"),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: new Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context, 'Cancel');
                  }),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  child: new Text(
                    "Ok",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    // call another functions here ---
                    Navigator.pop(context, 'Cancel');
                  })
            ],
          );
        });
  }

  Widget showActionsheet() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) => CupertinoActionSheet(
              title: new Text("Action Sheet Title"),
              message: new Text("Please select the best option from below"),
              actions: [
                CupertinoActionSheetAction(
                    child: new Text(
                      "option 1",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.pop(context, 'option 1');
                    }),
                CupertinoActionSheetAction(
                    child: new Text(
                      "option 2",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      // call another functions here ---
                      Navigator.pop(context, 'option 2');
                    }),
                CupertinoActionSheetAction(
                    child: new Text(
                      "option 3",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      // call another functions here ---
                      Navigator.pop(context, 'option 3');
                    }),
              ],
              cancelButton: CupertinoActionSheetAction(
                  child: new Text(
                    "Cancel",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    // call another functions here ---
                    Navigator.pop(context, 'Cancel');
                  }),
            ));
  }

  Widget showModal() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new CupertinoAlertDialog(
            title: new Text("Alert title"),
            // message: new Text("Please select the best option from below"),
            actions: [
              CupertinoActionSheetAction(
                  child: new Text(
                    "option 1",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context, 'option 1');
                  }),
              CupertinoActionSheetAction(
                  child: new Text(
                    "option 2",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    // call another functions here ---
                    Navigator.pop(context, 'option 2');
                  }),
              CupertinoActionSheetAction(
                  child: new Text(
                    "option 3",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    // call another functions here ---
                    Navigator.pop(context, 'option 3');
                  }),
            ],
          );
        });
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
