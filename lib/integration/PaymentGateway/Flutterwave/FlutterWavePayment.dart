import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:smartkit/integration/PaymentGateway/Flutterwave/overlay_loader.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';
import 'package:smartkit/integration/helper/Constant.dart';
import 'GhanaPaymentWebview.dart';

class FlutterWavePayment extends StatefulWidget {
  double amount;
  Function callback;
  int type;
  FlutterWavePayment({
    Key key,
    this.amount,
    this.callback,
    this.type,
  }) : super(key: key);
  @override
  _FlutterWavePaymentState createState() => _FlutterWavePaymentState();
}

class _FlutterWavePaymentState extends State<FlutterWavePayment> {
  TextEditingController edtmobileno = TextEditingController();
  TextEditingController edtamount = TextEditingController();
  TextEditingController edtname = TextEditingController();
  TextEditingController edtemail = TextEditingController();
  bool isloading = false;
  final _formKey = GlobalKey<FormState>();
  final _formKeycard = GlobalKey<FormState>();

  //GhanaMobile
  Timer clocktimer;
  GlobalKey<ScaffoldState> _scaffoldKey;
  bool eventloading = false;
  String transactionid = "";

  var _networks = ['MTN', 'Tigo', 'Vodafone'];
  String _selectedNetwork;
  TextEditingController edtphone = TextEditingController();
  TextEditingController edtvoucher = TextEditingController();

  String refno = "";
  int matchsecond = 5;
  bool startverify = false;
  int sendamt;

  bool isVodaFoneSelected() => _networks.indexOf(_selectedNetwork) == 2;
  var radius = BorderRadius.all(Radius.circular(1.5));

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.type == 1
        ? flutterwaveMpesaWidget()
        : widget.type == 2
            ? flutterwaveGhanaMobileWidget()
            : Container();
  }

  Widget flutterwaveMpesaWidget() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              controller: edtname,
              cursorColor: Colors.black,
              keyboardType: TextInputType.name,
              validator: (val) => val.trim().isEmpty ? 'Enter Name' : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Name',
                hintText: 'Enter Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              controller: edtemail,
              cursorColor: Colors.black,
              keyboardType: TextInputType.name,
              validator: (val) => Constant.validateEmail(val),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Email',
                hintText: 'Enter Email',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              controller: edtmobileno,
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator: (val) => Constant.validateMobile(val),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Mobile Number',
                hintText: 'Enter Mobile Number',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextFormField(
              controller: edtamount,
              cursorColor: Colors.black,
              keyboardType: TextInputType.number,
              validator: (val) => val.trim().isEmpty || double.parse(val.trim()) <= 0 ? "Enter Amount" : null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Amount',
                hintText: 'Enter Amount',
              ),
            ),
          ),
          if (isloading) Center(child: new CircularProgressIndicator()),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                onPrimary: ColorsRes.white,
                primary: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
              child: Text('Send Amount'),
              onPressed: () {
                if (_formKey.currentState.validate() && !isloading) {
                  mPesaPayment(edtmobileno.text, edtamount.text, edtemail.text, edtname.text);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget flutterwaveGhanaMobileWidget() {
    return Container(
      child: Stack(
        children: [
          Container(
            child: Center(
              child: Card(
                //margin: EdgeInsets.all(10),color: Colors.firstgradientcolor.withOpacity(0.5),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          child: Row(
                            children: [
                              Text(
                                "${Constant.ghanaCurrencySymbol}",
                                style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
                              ),
                              Text(
                                edtamount.text,
                                style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              ),
                              //Text(" $amount",style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),),
                            ],
                          ),
                        ),
                        if (isVodaFoneSelected()) Divider(),
                        setTopWidget(),
                        SizedBox(height: 10),
                        TextFormField(
                            cursorColor: Colors.black,
                            controller: edtname,
                            keyboardType: TextInputType.name,
                            validator: (val) => val.trim().isEmpty ? 'Enter Name' : null,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
                                fillColor: Colors.grey[50],
                                filled: true,
                                errorStyle: TextStyle(fontSize: 12),
                                errorMaxLines: 3,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1.5), borderRadius: radius),
                                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1), borderRadius: radius),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: .5), borderRadius: radius),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: 1), borderRadius: radius),
                                hintText: 'Enter Name')),
                        TextFormField(
                            cursorColor: Colors.black,
                            controller: edtemail,
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) => Constant.validateEmail(val),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
                                fillColor: Colors.grey[50],
                                filled: true,
                                errorStyle: TextStyle(fontSize: 12),
                                errorMaxLines: 3,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1.5), borderRadius: radius),
                                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1), borderRadius: radius),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: .5), borderRadius: radius),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: 1), borderRadius: radius),
                                hintText: 'Enter Email')),
                        TextField(
                            controller: edtphone,
                            cursorColor: Colors.black,
                            textInputAction: isVodaFoneSelected() ? TextInputAction.next : TextInputAction.done,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Phone Number',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
                                fillColor: Colors.grey[50],
                                filled: true,
                                errorStyle: TextStyle(fontSize: 12),
                                errorMaxLines: 3,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1.5), borderRadius: radius),
                                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1), borderRadius: radius),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: .5), borderRadius: radius),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: 1), borderRadius: radius),
                                hintText: '233xxxxxxx')),
                        TextFormField(
                            cursorColor: Colors.black,
                            controller: edtamount,
                            keyboardType: TextInputType.number,
                            validator: (val) => val.trim().isEmpty || double.parse(val.trim()) <= 0 ? "Enter Amount" : null,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Amount',
                                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w500),
                                fillColor: Colors.grey[50],
                                filled: true,
                                errorStyle: TextStyle(fontSize: 12),
                                errorMaxLines: 3,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
                                focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1.5), borderRadius: radius),
                                errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1), borderRadius: radius),
                                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: .5), borderRadius: radius),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[400].withOpacity(.7), width: 1), borderRadius: radius),
                                hintText: 'Enter Amount')),
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
                        if (isVodaFoneSelected())
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
                              focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1.5), borderRadius: radius),
                              errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 1), borderRadius: radius),
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
                                } else if (isVodaFoneSelected() && edtvoucher.text.trim().isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter Voucher')));
                                } else if (!checkinternet) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check Internet Connection')));
                                } else {
                                  transactionid = "${new DateTime.now().millisecond}";

                                  Map data = {
                                    "tx_ref": transactionid,
                                    "amount": edtamount.text,
                                    "currency": Constant.ghanaCurrencyCode,
                                    //"voucher":"143256743",
                                    "network": _selectedNetwork,
                                    "email": edtemail.text,
                                    "phone_number": edtphone.text,
                                    "fullname": edtname.text,
                                    // "client_ip": ipAddress,
                                    //"device_fingerprint":"62wd23423rq324323qew1",
                                    "redirect_url": Constant.localhosturl,
                                  };

                                  if (isVodaFoneSelected()) data['voucher'] = edtvoucher.text;

                                  ghanaPayment(data);
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
                                      "Submit Voucher/OTP",
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

                        /*FlatButton(child: Text("test"),onPressed: (){
                            MPesaPayment();
                        },),*/
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
                    style: Theme.of(context).textTheme.headline3.merge(TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget setTopWidget() {
    if (isVodaFoneSelected()) {
      // This instruction is for Vodafone. Apparently, other networks don't need
      // instructions
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

  mPesaPayment(String phonenumber, String mainamt, String uemail, String uname) async {
    if (!isloading)
      setState(() {
        isloading = true;
      });

    String url;
    if (Constant.isFlutterwaveTest) {
      url = Constant.mpesatesturl;
    } else {
      url = Constant.mpesaliveurl;
    }

    String txref = "${new DateTime.now().millisecond}";

    Map data = {
      'tx_ref': "$txref",
      'amount': mainamt,
      'type': 'mpesa',
      'currency': Constant.flutterwaveCurrency,
      'country': Constant.flutterwaveCountry,
      'email': uemail,
      'phone_number': phonenumber,
      'fullname': uname,
      'public_key': Constant.flutterwavePubKey,
      "is_mpesa": "1",
      "is_mpesa_lipa": "1"
    };

    var body = utf8.encode(json.encode(data));

    Response response = await post(
      Uri.parse(url),
      body: body,
      headers: {"content-type": "application/json", "Authorization": "Bearer " + Constant.flutterwaveSecKey},
    );

    setState(() {
      isloading = false;
    });

    print("mpesa-**--${response.statusCode}");
    print("mpesa---${response.body.toString()}");
    final res = json.decode(response.body);
    if (response.statusCode == 200) {
      print("mpesa---${response.body.toString()}");

      String status = res['status'];
      if (status.trim().toLowerCase() == "success" || status.trim().toLowerCase() == "successful") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Verifying Transaction')));

        //verifying transaction
        setState(() {
          isloading = true;
        });
        Map vdata = {'txref': "$txref", 'SECKEY': Constant.flutterwaveSecKey};

        var vbody = utf8.encode(json.encode(vdata));

        Response vresponse = await post(
          Uri.parse(Constant.flutterwaveVerifyUrl),
          body: vbody,
          headers: {
            "content-type": "application/json"
            //"Authorization": "Bearer " + Constant.FlutterwaveSecKey
          },
        );

        setState(() {
          isloading = false;
        });

        final vres = json.decode(vresponse.body);
        if (vresponse.statusCode == 200) {
          print("mpesa--verify-${vresponse.body.toString()}");

          String vstatus = vres['status'];
          if (vstatus.trim().toLowerCase() == "success" || vstatus.trim().toLowerCase() == "successful") {
            //SetTransactionData
            //here we can get success transaction we can set transaction reference in out backend from here

            widget.callback(vres['data']['txid'].toString(), "Success");

            edtname.clear();
            edtemail.clear();
            edtamount.clear();
            edtmobileno.clear();
            setState(() {});
          } else {
            widget.callback("", "Fail");
          }
        } else {
          widget.callback("", "Fail");
        }
      } else {
        widget.callback("", "Fail");
      }
    } else {
      widget.callback("", "Fail");
    }
  }

  ghanaPayment(Map data) async {
    print("ghana---");
    setState(() {
      eventloading = true;
    });

    String url;
    if (Constant.isFlutterwaveTest) {
      url = Constant.ghanatesturl;
    } else {
      url = Constant.ghanaliveurl;
    }
    //transactionid = "${Constant.session.getData(UserSessionManager.KEY_ID)}_${new DateTime.now().millisecond}";

    print("mpesa--$transactionid--$url");

    Map data = {
      "tx_ref": transactionid,
      "amount": "5",
      "currency": "GHS",
      //"voucher":"143256743",
      "network": "MTN",
      "email": "user@gmail.com",
      "phone_number": "054709929220",
      "fullname": "John Madakin",
      "client_ip": "154.123.220.1",
      "device_fingerprint": "62wd23423rq324323qew1",
      "redirect_url": Constant.localhosturl,
    };

    //var body = JsonEncoder().convert(data);
    var body = utf8.encode(json.encode(data));

    Response response = await post(
      Uri.parse(url),
      body: body,
      headers: {"content-type": "application/json", "Authorization": "Bearer " + Constant.flutterwaveSecKey},
    );

    setState(() {
      eventloading = false;
    });

    print("ghanapay-**--${response.statusCode}");
    print("ghanapay---${response.body.toString()}");
    final res = json.decode(response.body);
    if (response.statusCode == 200) {
      print("ghanapay---${response.body.toString()}");

      String status = res['status'];
      if (status.trim().toLowerCase() == "success" || status.trim().toLowerCase() == "successful") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Verifying Transaction')));

        String redirectionurl = res['meta']['authorization']['redirect'];
        print("===redirectionurl---$redirectionurl");

        Navigator.of(context).push(MaterialPageRoute(builder: (context) => GhanaPaymentWebview(redirectionurl, this.callbackFun, transactionid)));
      } else {
        widget.callback("", "Fail");
      }
    } else {
      widget.callback("", "Fail");
    }
  }

  Future<void> callbackFun() async {
    print("=====backwebview--$transactionid");

    //verifying transaction

    eventloading = true;

    Map vdata = {'txref': "$transactionid", 'SECKEY': Constant.flutterwaveSecKey};
    //var vbody = json.encode(vdata);
    var vbody = utf8.encode(json.encode(vdata));

    Response vresponse = await post(
      Uri.parse(Constant.flutterwaveVerifyUrl),
      body: vbody,
      headers: {
        "content-type": "application/json"
        //"Authorization": "Bearer " + Constant.FlutterwaveSecKey
      },
    );

    setState(() {
      eventloading = false;
      //event.isprocess = false;
    });

    final vres = json.decode(vresponse.body);

    if (vresponse.statusCode == 200) {
      print("mpesa--verify-${vresponse.body.toString()}");

      String vstatus = vres['status'];
      if (vstatus.trim().toLowerCase() == "success" || vstatus.trim().toLowerCase() == "successful") {
        widget.callback(vres['data']['txid'].toString(), "Success");
      } else {
        widget.callback("", "Fail");
      }
    } else {
      widget.callback("", "Fail");
    }

    edtname.clear();
    edtamount.clear();
    edtemail.clear();
    edtphone.clear();
    transactionid = '';
  }
}
