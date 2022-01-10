import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:smartkit/integration/PaymentGateway/Flutterwave/overlay_loader.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';
import 'package:smartkit/integration/helper/Constant.dart';

class PaystackGhanaMobMoney extends StatefulWidget {
  double amount;
  Function callback;
  PaystackGhanaMobMoney({
    Key key,
    this.amount,
    this.callback,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new GhanaMobileMoneyState();
  }
}

class GhanaMobileMoneyState extends State<PaystackGhanaMobMoney> {
  Timer clocktimer;

  bool eventloading = false;
  String transactionid = "";

  var _networks = ['MTN', 'Tigo', 'Vodafone'];
  String _selectedNetwork;
  TextEditingController edtphone = TextEditingController();
  TextEditingController edtvoucher = TextEditingController();
  bool isloading = false;
  bool isotpview = false;
  String refno = "";
  int matchsecond = 5;
  bool startverify = false;
  int sendamt;

  void _getTime(String newrefno) {
    matchsecond = matchsecond - 1;

    setState(() {});
    if (matchsecond <= 0) {
      if (clocktimer != null) clocktimer.cancel();
      startverify = false;
      VerifyTransaction(refno);
    }
  }

  StartNewTimer(String newrefno) {
    matchsecond = 5;
    setState(() {
      startverify = true;
      isloading = false;
    });
    if (clocktimer != null) clocktimer.cancel();
    clocktimer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime(newrefno));
  }

  @override
  void initState() {
    super.initState();
    double mainsendamt = widget.amount * 100;
    sendamt = mainsendamt.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
          height: 550,
          width: MediaQuery.of(context).size.width - 10,
          child: Stack(
            children: [
              Container(
                child: Center(
                  child: Card(
                    //margin: EdgeInsets.all(10),color: ColorsRes.firstgradientcolor.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: ColorsRes.grey,
                                  ),
                                )),
                            Padding(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Row(
                                children: [
                                  Text(
                                    "${Constant.paystackCurrency}",
                                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.w400)),
                                  ),
                                  Text(
                                    widget.amount.toString(),
                                    style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              ),
                            ),
                            if (isVodaFoneSelected()) Divider(),
                            SetTopWidget(),
                            SizedBox(height: 10),
                            if (!isotpview)
                              DropdownButtonHideUnderline(
                                child: InputDecorator(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.grey[50],
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: .5), borderRadius: BorderRadius.all(Radius.circular(1.5))),
                                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: 1), borderRadius: BorderRadius.all(Radius.circular(1.5))),
                                    hintText: 'Select network',
                                  ),
                                  isEmpty: _selectedNetwork == null,
                                  child: new DropdownButton<String>(
                                    value: _selectedNetwork,
                                    isDense: true,
                                    onChanged: (String newValue) {
                                      setState(() => _selectedNetwork = newValue);
                                    },
                                    items: _networks.map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            if (!isotpview)
                              TextField(
                                  controller: edtphone,
                                  cursorColor: Colors.black,
                                  textInputAction: isVodaFoneSelected() ? TextInputAction.next : TextInputAction.done,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: 'PHONE NUMBER',
                                      labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
                                      fillColor: Colors.grey[50],
                                      filled: true,
                                      errorStyle: TextStyle(fontSize: 12),
                                      errorMaxLines: 3,
                                      isDense: true,
                                      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                                      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsRes.appcolor, width: 1.5), borderRadius: radius),
                                      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsRes.appcolor, width: 1), borderRadius: radius),
                                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: .5), borderRadius: radius),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: 1), borderRadius: radius),
                                      hintText: '233xxxxxxx')),
                            //if(isVodaFoneSelected())
                            if (isotpview)
                              TextField(
                                controller: edtvoucher,
                                cursorColor: Colors.black,
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                  hintText: 'VOUCHER/OTP',
                                  labelText: 'VOUCHER/OTP',
                                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
                                  fillColor: Colors.grey[50],
                                  filled: true,
                                  errorStyle: TextStyle(fontSize: 12),
                                  errorMaxLines: 3,
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                                  focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsRes.appcolor, width: 1.5), borderRadius: radius),
                                  errorBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorsRes.appcolor, width: 1), borderRadius: radius),
                                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: .5), borderRadius: radius),
                                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: 1), borderRadius: radius),
                                ),
                              ),

                            if (eventloading)
                              Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: new CircularProgressIndicator(),
                              )),
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(top: 20, bottom: 15),
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (!eventloading) {
                                    bool checkinternet = await Constant.CheckInternet();
                                    if (_selectedNetwork == null) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Select Network')));
                                    } else if (Constant.validateMobile(edtphone.text.trim()) != null) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Valid Mobile Number')));
                                    } else if (isotpview && edtvoucher.text.trim().isEmpty) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Voucher/OTP')));
                                    } else if (!checkinternet) {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check Internet Connection')));
                                    } else {
                                      if (!isotpview) {
                                        transactionid = "${new DateTime.now().millisecond}";

                                        Map data = {
                                          "tx_ref": transactionid,
                                          "amount": sendamt,
                                          "currency": Constant.paystackCurrency,
                                          //"voucher":"143256743",
                                          "network": _selectedNetwork,
                                          "email": 'user@gmail.com',
                                          "phone_number": edtphone.text,
                                          "fullname": "testuser",
                                          // "client_ip": ipAddress,
                                          //"device_fingerprint":"62wd23423rq324323qew1",
                                          "redirect_url": Constant.localhosturl,
                                          "mobile_money": {"phone": edtphone.text, "provider": _selectedNetwork.toLowerCase()}
                                        };

                                        if (isVodaFoneSelected()) data['mobile_money']['voucher'] = edtvoucher.text;

                                        GhanaPayment(data);
                                      } else {
                                        SubmitOtp(edtvoucher.text.trim());
                                      }
                                    }
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  onPrimary: ColorsRes.white,
                                  primary: Colors.black,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Align(
                                        child: Text(
                                          !isotpview ? "Pay ${Constant.paystackCurrency} ${widget.amount}" : "Submit Voucher/OTP",
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                    Icon(Icons.keyboard_arrow_right, color: Colors.white)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (isloading)
                Positioned.fill(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      OverlayLoaderWidget(),
                      SizedBox(height: 20),
                      Text(
                        "Please, do not close this page.",
                        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              if (startverify)
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        matchsecond.toString(),
                        style: Theme.of(context).textTheme.headline3.merge(TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ));
  }

  Widget SetTopWidget() {
    if (isVodaFoneSelected()) {
      var textStyle = TextStyle(color: Colors.grey[900], fontWeight: FontWeight.normal);
      var boldStyle = textStyle.copyWith(fontWeight: FontWeight.bold);
      return Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 25),
        child: RichText(
          text: TextSpan(text: '', style: textStyle, children: <TextSpan>[
            TextSpan(
              text: 'Please follow the instruction below to get your voucher code',
              style: boldStyle,
            ),
            TextSpan(text: '\n\n\n1. Dial '),
            TextSpan(text: '*110#', style: boldStyle),
            TextSpan(text: ' to generate your transaction voucher.'),
            TextSpan(text: '\n\n2. Select '),
            TextSpan(text: 'OPTION 6', style: boldStyle),
            TextSpan(text: ' to generate the voucher.'),
            TextSpan(text: '\n\n\3. Enter your PIN in next prompt.'),
            //TextSpan(text: '\n\n\4. Input the voucher generated in the voucher field below.'),
          ]),
        ),
      );
    } else {
      return SizedBox();
    }
  }

  bool isVodaFoneSelected() => _networks.indexOf(_selectedNetwork) == 2;

  var radius = BorderRadius.all(Radius.circular(1.5));

  GhanaPayment(Map data) async {
    bool checkinternet = await Constant.CheckInternet();
    if (!checkinternet) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check Internet Connection')));
    } else {
      print("ghana---");
      setState(() {
        eventloading = true;
      });

      String url = Constant.PayStackMobileMoneyChargeUrl;

      print("ghana--$transactionid--$url");

      //var body = JsonEncoder().convert(data);
      var body = utf8.encode(json.encode(data));

      Response response = await post(
        Uri.parse(url),
        body: body,
        headers: {"content-type": "application/json", "Authorization": "Bearer " + Constant.paystackSecKey},
      );

      setState(() {
        eventloading = false;
      });

      print("ghanapay-**--${response.statusCode}");
      // print("ghanapay---${response.body.toString()}");
      final res = json.decode(response.body);
      if (response.statusCode == 200) {
        print("ghanapay---${response.body.toString()}");

        //String status = res['status'];
        String status = res['data']['status'].toString().trim().toLowerCase();
        refno = res['data']['reference'];

        if (status == "success" || status == "successful") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Verifying Transaction')));

          StartNewTimer(refno);
        } else if (status == 'pending') {
          //VerifyTransaction(refno);
          StartNewTimer(refno);
        } else if (status == 'pay_offline') {
          //VerifyTransaction(refno);
          StartNewTimer(refno);
          //SetTransactionData(refno, "true");

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['data']['display_text'])));
        } else if (status == 'send_otp') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['data']["display_text"])));

          setState(() {
            isotpview = true;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['message'] ?? "Transaction Failed")));
          widget.callback("", "Failed");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['message'] ?? "Transaction Failed")));
        widget.callback("", "Failed");
      }
    }
  }

  SubmitOtp(String otp) async {
    bool checkinternet = await Constant.CheckInternet();
    if (!checkinternet) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check Internet Connection')));
    } else {
      setState(() {
        eventloading = true;
      });

      String url = Constant.PayStackMobileMoneySubmitOtpURl;
      Map data = {
        "otp": otp,
        "reference": refno,
      };

      var body = utf8.encode(json.encode(data));

      Response response = await post(
        Uri.parse(url),
        body: body,
        headers: {"content-type": "application/json", "Authorization": "Bearer " + Constant.paystackSecKey},
      );

      setState(() {
        eventloading = false;
      });

      print("ghanapay-**--${response.statusCode}");
      // print("ghanapay---${response.body.toString()}");
      final res = json.decode(response.body);
      if (response.statusCode == 200) {
        print("ghanapay---${response.body.toString()}");

        //String status = res['status'];
        String status = res['data']['status'].toString().trim().toLowerCase();

        if (status == "success" || status == "successful") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Verifying Transaction')));

          //VerifyTransaction(refno);
          StartNewTimer(refno);
        } else if (status == 'pending') {
          //VerifyTransaction(refno);
          StartNewTimer(refno);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['message'] ?? "Transaction Failed")));
          widget.callback("", "Failed");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['message'] ?? "Transaction Failed")));
        widget.callback("", "Failed");
      }
    }
  }

  VerifyTransaction(String refid) async {
    bool checkinternet = await Constant.CheckInternet();
    if (!checkinternet) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check Internet Connection')));
    } else {
      if (!isloading)
        setState(() {
          isloading = true;
        });

      //var vbody = utf8.encode(json.encode(vdata));

      Response vresponse = await get(
        Uri.parse(Constant.PayStackMobileMoneyVerifyUrl + refid),
        headers: {"content-type": "application/json", "Authorization": "Bearer " + Constant.paystackSecKey},
      );

      setState(() {
        isloading = false;
      });
      print("ghana--verify-status-${vresponse.statusCode}");
      final vres = json.decode(vresponse.body);
      if (vresponse.statusCode == 200) {
        print("ghana--verify-${vresponse.body.toString()}");

        String vstatus = vres['data']['status'].toString().trim().toLowerCase();
        if (vstatus == "success" || vstatus == "successful") {
          String transId = "${vres['data']['id']}|$refid";
          widget.callback("$transId", "Success");
        } else if (vstatus == 'pending') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(vres['message'] ?? "Transaction Pending")));

          widget.callback("$refid", "Pending");
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(vres['message'] ?? "Transaction Failed")));
          widget.callback("", "Failed");
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(vres['message'] ?? "Transaction Failed")));
        widget.callback("", "Failed");
      }

      Navigator.of(context).pop();
    }
  }
}
