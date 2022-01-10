import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'ColorsRes.dart';
import 'package:http/http.dart' as http;

class Constant {
  //stripe keys
  static String stripePubkey = "pk_test_sREVqI5A1IYzKIKQWFuHRSy600Yyf3wWwf";
  static String stripeSeckey = "sk_test_udo2toyNTi67pQj3mvndb0yo001oJo4q9i";
  static String stripeMode = "test";
  static String currencysymbol = "\$";
  static String currencyname = "USD";
  static String nairaSymbol = "₦";

  //Flutterwave
  static String mpesatesturl = "https://ravesandboxapi.flutterwave.com/v3/charges?type=mpesa";

  static String mpesaliveurl = "https://api.flutterwave.com/v3/charges?type=mpesa";
  static String flutterwaveVerifyUrl = "https://api.ravepay.co/flwv3-pug/getpaidx/api/v2/verify";

  static String ghanatesturl = "https://ravesandboxapi.flutterwave.com/v3/charges?type=mobile_money_ghana";
  static String ghanaliveurl = "https://api.flutterwave.com/v3/charges?type=mobile_money_ghana";

  static String cardtesturl = "https://ravesandboxapi.flutterwave.com/v3/charges?type=card";
  static String cardliveurl = "https://api.flutterwave.com/v3/charges?type=card";

  static bool isFlutterwaveTest = true;
  static String flutterwaveCurrency = "KES";
  static String flutterwaveCountry = "KE";
  static String flutterwavePubKey = "FLWPUBK_TEST-19703bf65ef01fd664e68631423e51f5-X";
  static String flutterwaveEncKey = "FLWSECK_TEST9dd3c49c7b56";
  static String flutterwaveSecKey = "FLWSECK_TEST-3b1cb0fdc47d03e031c6c1ca6ae72760-X";

  //GhanaMobile
  static String ghanaCurrencySymbol = 'GH₵';
  static String ghanaCurrencyCode = "GHS";
  static String localhosturl = "http://127.0.0.1:8184";

//paystack
  static String paystackPublicKey = 'pk_test_acd94ceb253d863de9919352347f01631aede3a3';
  static String paystackSecKey = 'sk_test_2a6915c2a355d61637bee6ae0a3f0d44dee1c34a';
  static String paystackCurrency = 'GHS';
  static String PayStackMobileMoneyChargeUrl = "https://api.paystack.co/charge";
  static String PayStackMobileMoneyVerifyUrl = "https://api.paystack.co/transaction/verify/"; //:reference";
  static String PayStackMobileMoneySubmitOtpURl = "https://api.paystack.co/charge/submit_otp";

  //Razorpay
  static String razorpayKeyID = 'rzp_test_7e65L1I1fBukZw';
  static String razorpaySecKey = 'puRnpFQgODHvlxDsI2q6SRoz';

  //

  static Future<bool> CheckInternet() async {
    bool check = false;
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      check = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      check = true;
    }

    return check;
  }

  static String validateEmail(String value) {
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.trim().isEmpty || !regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  static String validateMobile(String value) {
    if (value.trim().isEmpty || value.trim().length < 10 || value.trim().length > 14)
      return 'Enter Valid Mobile Number';
    else
      return null;
  }

  static ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: ColorsRes.white,
    primary: ColorsRes.appcolor,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
  );

  static Future postApiFile(String url, Map<String, File> filelist, BuildContext context, Map<String, String> body) async {
    var request;
    if (url.isNotEmpty)
      request = http.MultipartRequest('POST', Uri.parse(url));
    else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Pleas add url")));
    body.forEach((key, value) {
      request.fields[key] = value;
    });
    request.fields[''] = '';
    body[''] = "";
    filelist.forEach((key, value) async {
      var pic = await http.MultipartFile.fromPath(key, value.path);
      request.files.add(pic);
    });
    var res = await request.send();
    var responseData = await res.stream.toBytes();
    var response = String.fromCharCodes(responseData);
    if (res.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

  static Future PostApiData(String url, Map<String, String> body, BuildContext context) async {
    body[''] = '';
    body[''] = "";
    Response response;
    if (url.isNotEmpty)
      response = await post(url, body: body);
    else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Pleas add url")));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }
}
