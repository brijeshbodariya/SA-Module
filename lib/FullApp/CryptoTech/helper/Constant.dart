import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/MainActivity.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/UIData.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'DesignConfig.dart';
import 'StringsRes.dart';

class Constant {
  static String CURRENCYNAME = "Naira";
  static String CURRENCYSYMBOL = "₦";
  static String USCURRENCYSYMBOL = "\$";
  static int LOAD_ITEM_LIMIT = 10;

  static String UserType_Amateur = 'amateur';
  static String UserType_Pro = 'pro';

  static String Filter_all = 'all';
  static String Filter_today = 'today';
  static String Filter_week = 'week';
  static String Filter_month = 'month';
  static String Filter_year = 'year';

  static String perfectmoney = "Perfect Money";
  static String paxfulbitcoin = "Paxful Bitcoin";
  static String btc = "BTC";
  static String eth = "ETH";
  static String ltct = "LTCT";
  static String ltc = "LTC";
  static String usd = "USD";
  static String usdt = "USDT";
  static String pm = "PM";

  static String setFirstLetterUppercase(String value) {
    return value == null || value.isEmpty ? "" : "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  }

  static String SetStatuswithSplit(String value) {
    if (value == null || value.isEmpty) return "";

    List<String> data = value.split("_");
    String mainvalue = "";
    for (int i = 0; i < data.length; i++) {
      mainvalue = mainvalue + " " + setFirstLetterUppercase(data[i]);
    }
    return value == null || value.isEmpty ? "" : "${mainvalue}";
  }

  static Color StatusColor(String status) {
    String lowerstatus = status.toLowerCase();
    Color color = ColorsRes.green;

    if (lowerstatus == "completed" || lowerstatus.contains("success") || lowerstatus == 'delivered')
      color = ColorsRes.green;
    else if (lowerstatus == StringsRes.pending.toLowerCase() || lowerstatus == 'received')
      color = ColorsRes.orange;
    else if (lowerstatus == 'shipped')
      color = ColorsRes.cardblue;
    else if (lowerstatus == "cancelled" || lowerstatus == "rejected" || status == "Cancelled / Timed Out" || status.contains("Cancel") || status.contains("Timed Out")) color = ColorsRes.red;

    return color;
  }

  static String validateEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return '${StringsRes.enter_valid_email}';
    else
      return null;
  }

  static String validateMobile(String value) {
    if (value.trim().length < 10 || value.trim().length > 14)
      return '${StringsRes.enter_valid_mobile}';
    else
      return null;
  }

  static Widget ImageWidget(String path, double imgheight, double imgwidth) {
    String extension = path.trim().isEmpty ? '' : path.split(".").last;

    if (path.trim().isEmpty) {
      return WebsafeSvg.network(
        UIData.userimage,
        height: imgheight,
        width: imgwidth,
        fit: BoxFit.fill,
      );
    } else if (!path.trim().contains("http")) {
      return WebsafeSvg.network(
        "https://smartkit.wrteam.in/smartkit/cryptotech/avatar/$path",
        height: imgheight,
        width: imgwidth,
        fit: BoxFit.fill,
      );
    } else if (extension == 'svg') {
      return WebsafeSvg.network(path,
          height: imgheight,
          width: imgwidth,
          fit: BoxFit.fill,
          placeholderBuilder: (BuildContext context) => WebsafeSvg.network("https://smartkit.wrteam.in/smartkit/cryptotech/avatar/defaultprofile.svg", fit: BoxFit.fill, height: imgheight, width: imgwidth));
    } else {
      return FadeInImage.assetNetwork(image: path, height: imgheight, width: imgwidth, fit: BoxFit.fill, placeholder: "https://smartkit.wrteam.in/smartkit/cryptotech/defaultprofile.png");
    }
  }

  static String DisplayDateTime(String senddate, bool withtime) {
    var date = new DateTime.fromMillisecondsSinceEpoch(int.parse(senddate) * 1000);

    if (withtime) {
      return DateFormat('dd/MM/yyyy hh:mm:ss a').format(date);
    } else {
      return DateFormat('dd/MM/yyyy').format(date);
    }
  }

  static String DisplayDateTimeyearText(String senddate) {
    var date = new DateTime.fromMillisecondsSinceEpoch(int.parse(senddate) * 1000);
    DateTime currdate = new DateTime.now();

    if (currdate.year == date.year)
      return DateFormat('MMM dd').format(date);
    else
      return DateFormat('MMM dd, yyyy').format(date);
  }

  static Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load(path);

    final file = File('${(await getTemporaryDirectory()).path}/${path.split("/").last}');
    await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  static void GoToMainPage(String from, BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => MainActivity(from, 0)), (Route<dynamic> route) => false);
  }

  static Future<void> ResetPinDialog(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) async {
    TextEditingController _textFieldController = TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          StreamController<String> controller = StreamController<String>.broadcast();
          return AlertDialog(
            shape: DesignConfig.SetRoundedBorder(ColorsRes.white, 12),
            title: Text(StringsRes.resetpin),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _textFieldController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: StringsRes.password),
                ),
                StreamBuilder(
                    stream: controller.stream,
                    builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                      return snapshot.hasData && snapshot.data == 'loading'
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            )
                          : Text(
                              snapshot.hasData ? snapshot.data : '',
                              style: TextStyle(color: ColorsRes.red),
                            );
                    }),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                //color: Colors.red,
                textColor: ColorsRes.black,
                child: Text(StringsRes.cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                //color: Colors.green,
                textColor: ColorsRes.firstgradientcolor,
                child: Text(StringsRes.sendrequest),
                onPressed: () async {
                  controller.add('');
                },
              ),
            ],
          );
        });
  }
}
