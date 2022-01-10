import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/model/City.dart';
import 'package:smartkit/FullApp/FoodMaster/tablet/activity/MainHomePageTablet.dart';
import 'StringsRes.dart';
import 'package:intl/intl.dart';

class Constant {
//test url
  static String mainUrl = "http://test.skegujarat.com/";
  static String imagepath = "";

  static String baseUrl = mainUrl + "api/v2/client/";
  static String appSecret = "app_secret";
  static String forgotpasswordurl = mainUrl + "password/reset";

  // static DatabaseHelper db;

  static String currencysymbol = "\$";
  static String googleApiKey = "";

//stripe keys
  static String stripePubkey = "pk_test_sREVqI5A1IYzKIKQWFuHRSy600Yyf3wWwf";
  static String stripeSeckey = "sk_test_udo2toyNTi67pQj3mvndb0yo001oJo4q9i";

  static String unpaid = 'unpaid';
  //filters
  static String restaurantFeatured = "featured";
  static String restaurantAll = "all";
  static String restaurantCity = "city";

  //deliverymethod
  static String getDeliveryMethodName(int method) {
    return method == 1 ? StringsRes.delivery : StringsRes.pickup;
  }

  //params
  static String apitoken = 'api_token';
  static String rating = 'rating';
  static String restaurantid = 'restaurant_id';
  static String restorant_id = 'restorant_id';
  static String comment = 'comment';
  static String categoryid = 'category_id';
  static String itemId = 'item_id';
  static String name = 'name';
  static String type = 'type';
  static String email = 'email';
  static String phone = 'phone';
  static String password = 'password';
  static String appsecret = 'app_secret';
  static String status = 'status';
  static String errMsg = 'errMsg';
  static String id = 'id';
  static String token = 'token';
  static String googleid = 'google_id';
  static String appleid = 'apple_id';
  static String fbid = 'fb_id';
  static String orderid = 'order_id';
  static String address = 'address';
  static String lat = 'lat';
  static String lng = 'lng';
  static String apartment = 'apartment';
  static String intercom = 'intercom';
  static String floor = 'floor';
  static String entry = 'entry';
  static String oldpassword = 'old_password';
  static String passwordconfirmation = 'password_confirmation';
  static String offset = 'offset';
  static String limit = 'limit';
  static String search = 'search';

  static String validateEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return '${StringsRes.entervalidemail}';
    else
      return null;
  }

  static void goToMainPage(String pagefrom, BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
            builder: (context) => MainHomePageTablet(
                  from: pagefrom,
                )),
        (Route<dynamic> route) => false);
  }

  static String setFirstLetterUppercase(String value) {
    return value == null || value.isEmpty ? "" : "${value[0].toUpperCase()}${value.substring(1).toLowerCase()}";
  }

  static var monthNames = '["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]';
  static var monthname = json.decode(monthNames);

  static String getFormatparse(String formattedString) {
    final RegExp re = new RegExp(r'^([+-]?\d{4,6})-?(\d\d)-?(\d\d)' // Day part.
        r'(?:[ T](\d\d)(?::?(\d\d)(?::?(\d\d)(?:\.(\d{1,6}))?)?)?' // Time part.
        r'( ?[zZ]| ?([-+])(\d\d)(?::?(\d\d))?)?)?$'); // Timezone part.

    Match match = re.firstMatch(formattedString);
    if (match != null) {
      int parseIntOrZero(String matched) {
        if (matched == null) return 0;
        return int.parse(matched);
      }

      // Parses fractional second digits of '.(\d{1,6})' into the combined
      // microseconds.
      int parseMilliAndMicroseconds(String matched) {
        if (matched == null) return 0;
        int length = matched.length;
        assert(length >= 1);
        assert(length <= 6);

        int result = 0;
        for (int i = 0; i < 6; i++) {
          result *= 10;
          if (i < matched.length) {
            result += matched.codeUnitAt(i) ^ 0x30;
          }
        }
        return result;
      }

      int years = int.parse(match[1]);
      int month = int.parse(match[2]);
      int day = int.parse(match[3]);
      int hour = parseIntOrZero(match[4]);
      int minute = parseIntOrZero(match[5]);
      int second = parseIntOrZero(match[6]);
      bool addOneMillisecond = false;
      int milliAndMicroseconds = parseMilliAndMicroseconds(match[7]);
      int millisecond = milliAndMicroseconds ~/ Duration.microsecondsPerMillisecond;
      int microsecond = milliAndMicroseconds.remainder(Duration.microsecondsPerMillisecond);

      bool isUtc = false;
      if (match[8] != null) {
        // timezone part
        isUtc = true;
        if (match[9] != null) {
          // timezone other than 'Z' and 'z'.
          int sign = (match[9] == '-') ? -1 : 1;
          int hourDifference = int.parse(match[10]);
          int minuteDifference = parseIntOrZero(match[11]);
          minuteDifference += 60 * hourDifference;
          minute -= sign * minuteDifference;
        }
      }

      final now = DateTime.now();
      final today = DateTime(now.year, now.month, now.day);
      final aDate = DateTime(years, month, day);

      String maintime = "${hour < 10 ? '0' : ''}$hour:${minute < 10 ? '0' : ''}$minute:${second < 10 ? '0' : ''}$second";

      String dtime = DateFormat.jm().format(DateFormat("hh:mm:ss").parse(maintime));

      if (aDate == today) {
        return dtime;
      } else {
        int curryear = now.year;

        String ddt = "${day < 10 ? '0' : ''}$day ${monthname[month - 1]}";

        if (curryear != years) ddt = ddt + " $years";

        return ddt + ",\t" + dtime;
      }
    } else {
      throw FormatException("Invalid date format", formattedString);
    }
  }

  static Color getOrderStatusColor(int statusid) {
    Color defaultcolor = ColorsRes.green;

    switch (statusid) {
      case 1:
        defaultcolor = ColorsRes.yellow;
        break;
      case 2:
        defaultcolor = ColorsRes.appcolor;
        break;
      case 4:
        defaultcolor = ColorsRes.yellow;
        break;
      case 8:
        defaultcolor = ColorsRes.red;
        break;
      case 9:
        defaultcolor = ColorsRes.red;
        break;
      case 11:
        defaultcolor = ColorsRes.red;
        break;
      case 12:
        defaultcolor = ColorsRes.red;
        break;
      case 10:
        defaultcolor = ColorsRes.appcolor;
        break;
      default:
        defaultcolor = ColorsRes.green;
        break;
    }
    return defaultcolor;
  }
}
