import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/CartPayment/PaymentPageMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/profile/AddressListMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Address.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Restaurant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'CartListPageMobile.dart';

StreamController<String> paymentstreamdata;
TimeSlot deliverytime;
Address deliveryaddressinfo;
double deliverycost;

class PaymentAddressPageMobile extends StatefulWidget {
  final String address, name, phone, openTime, closTome, mini, id;
  final List timeslot;
  const PaymentAddressPageMobile({Key key, this.address, this.name, this.phone, this.timeslot, this.openTime, this.closTome, this.mini, this.id}) : super(key: key);
  @override
  _PaymentAddressStateMobile createState() => _PaymentAddressStateMobile();
}

class _PaymentAddressStateMobile extends State<PaymentAddressPageMobile> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String deliverymethod = StringsRes.pickup.toLowerCase();
  String restaurantid = checkoutdata["vendor_id"].toString();
  bool timesloatloaded = false;
  Address selectedaddress;
  List<TimeSlot> timeSlotlist = [
    TimeSlot(id: "1", title: "8:00AM-8:30AM"),
    TimeSlot(id: "2", title: "8:30AM-9:00AM"),
    TimeSlot(id: "3", title: "9:00AM-10:00AM"),
    TimeSlot(id: "4", title: "4:00PM-5:00PM"),
    TimeSlot(id: "5", title: "5:00PM-6:00PM"),
  ];

  TextEditingController edtcomment = new TextEditingController();
  RoundedRectangleBorder cardshape;
  TextStyle headerstyle;
  EdgeInsets cardmargin = EdgeInsets.only(bottom: 10);

  bool loadingorder = false;

  @override
  void initState() {
    super.initState();
    deliverytime = null;
    deliveryaddressinfo = null;
    setupChannel();
  }

  void setupChannel() {
    paymentstreamdata = StreamController<String>();
    paymentstreamdata.stream.listen((response) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (paymentstreamdata != null && !paymentstreamdata.isClosed) paymentstreamdata.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    cardshape = DesignConfig.setRoundedBorder(ColorsRes.white, 10, false);
    headerstyle = Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold));

    return Scaffold(
      key: scaffoldKey,
      appBar: DesignConfig.setAppbar(StringsRes.lblpayment),
      bottomNavigationBar: ButtonClickAnimation(
        onTap: () {
          payProcees();
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(top: 13, bottom: 13),
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              alignment: Alignment.center,
              decoration: DesignConfig.buttonShadow(ColorsRes.appcolor, 30, ColorsRes.appcolor),
              child: Text(
                StringsRes.lblcheckout,
                style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          deliverypickupWidget(),
          deliverytimeWidget(),
          addressWidget(),
          commentWidget(),
          resinfoWidget(),
        ]),
      ),
    );
  }

  Widget addressWidget() {
    String shortaddress = '';
    String title = StringsRes.addaddressdeliver;

    if (selectedaddress != null) {
      title = selectedaddress.address;
      shortaddress = selectedaddress.apartment;
      if (selectedaddress.entry.trim().isNotEmpty) shortaddress = shortaddress + "\t,${StringsRes.entry}: ${selectedaddress.entry}";
      if (selectedaddress.floor.trim().isNotEmpty) shortaddress = shortaddress + "\t,${StringsRes.floor}: ${selectedaddress.floor}";
    }

    return Card(
      margin: cardmargin,
      shape: cardshape,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            StringsRes.shippingto,
            style: headerstyle,
          ),
          ListTile(
            dense: true,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.location_on,
                  color: ColorsRes.IconColor,
                ),
                Expanded(child: Text(title)),
              ],
            ),
            subtitle: Text(shortaddress),
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (context) => AddressListMobile(
                        fromcart: true,
                      )));
            },
          )
        ]),
      ),
    );
  }

  Widget deliverypickupWidget() {
    return Card(
      margin: cardmargin,
      shape: cardshape,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              StringsRes.deliveryorpickup,
              style: headerstyle,
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  deliverymethod = StringsRes.pickup.toLowerCase();
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Row(children: [
                  Icon(
                    StringsRes.pickup.toLowerCase() == deliverymethod ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: StringsRes.pickup.toLowerCase() == deliverymethod ? ColorsRes.IconColor : ColorsRes.grey,
                  ),
                  SizedBox(width: 10),
                  Text(
                    StringsRes.pickup,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ]),
              ),
            ),
            SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                setState(() {
                  deliverymethod = StringsRes.delivery.toLowerCase();
                });
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Row(children: [
                  Icon(
                    StringsRes.delivery.toLowerCase() == deliverymethod ? Icons.radio_button_checked : Icons.radio_button_off,
                    color: StringsRes.delivery.toLowerCase() == deliverymethod ? ColorsRes.IconColor : ColorsRes.grey,
                  ),
                  SizedBox(width: 10),
                  Text(
                    StringsRes.delivery,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ]),
              ),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Widget deliverytimeWidget() {
    return Card(
      margin: cardmargin,
      shape: cardshape,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              deliverymethod == StringsRes.delivery.toLowerCase() ? StringsRes.deliverytime : StringsRes.pickuptime,
              style: headerstyle,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<TimeSlot>(
                isExpanded: true,
                hint: Text(StringsRes.deliverytime),
                value: deliverytime,
                onChanged: (TimeSlot Value) {
                  setState(() {
                    deliverytime = Value;
                  });
                },
                items: timeSlotlist.map((TimeSlot dtime) {
                  return DropdownMenuItem<TimeSlot>(
                    value: dtime,
                    child: Text(
                      "\t${dtime.title}",
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget resinfoWidget() {
    return Card(
      margin: cardmargin,
      shape: cardshape,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.maxFinite,
            child: Text(
              StringsRes.restaurantinfo,
              style: headerstyle,
            ),
          ),
          Text(widget.name),
          Text(widget.address),
          Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/foodmaster/time_icon.png",height: 20,width:20),
                SizedBox(width: 10),
                Text(widget.openTime),
                Text("\tto\t"),
                Text(widget.closTome),
                SizedBox(width: 10),
              ])),
          GestureDetector(
            onTap: () async {
              if (widget.phone != null && widget.phone.trim().isNotEmpty) {
                String url = 'tel:${widget.phone}';
                if (await canLaunch(url) == null) {
                  throw 'Could not launch $url';
                } else {
                  await launch(url);
                }
              }
            },
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                Icons.call,
                color: ColorsRes.IconColor,
                size: 14,
              ),
              SizedBox(width: 10),
              Text(widget.phone),
              SizedBox(width: 10),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget commentWidget() {
    return Card(
        margin: cardmargin,
        shape: cardshape,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringsRes.comment,
                style: headerstyle,
              ),
              TextField(
                controller: edtcomment,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: StringsRes.paymentcmt,
                  hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(fontWeight: FontWeight.bold, color: ColorsRes.grey.withOpacity(0.5))),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> payProcees() async {
    List<Address> addwithfeelist = [
      (Address(
          id: 1,
          address: "6 Yukon Drive Raeford, NC 28376",
          createdat: "2021-02-18T11:50:31.000000Z",
          updatedat: "2021-02-26T12:17:24.000000Z",
          lat: "1.2222",
          lng: "3.2222",
          active: "1",
          userid: "1",
          apartment: "t1",
          intercom: "",
          floor: "1",
          entry: "",
          inRadius: true,
          rangeFound: true,
          cost_per_km: "10,",
          cost_total: "50")),
      Address(
          id: 2,
          address: "8 Sardar nagar",
          createdat: "2021-02-18T11:50:31.000000Z",
          updatedat: "2021-02-26T12:17:24.000000Z",
          lat: "1.2222",
          lng: "3.2222",
          active: "1",
          userid: "1",
          apartment: "t1",
          intercom: "",
          floor: "1",
          entry: "",
          inRadius: true,
          rangeFound: true,
          cost_per_km: "10,",
          cost_total: "50"),
      Address(
          id: 3,
          address: "9 Yukon Drive Raeford, NC 28376, NC 28376",
          createdat: "2021-02-18T11:50:31.000000Z",
          updatedat: "2021-02-26T12:17:24.000000Z",
          lat: "1.2222",
          lng: "3.2222",
          active: "1",
          userid: "1",
          apartment: "t1",
          intercom: "",
          floor: "1",
          entry: "",
          inRadius: true,
          rangeFound: true,
          cost_per_km: "10,",
          cost_total: "50"),
      Address(
          id: 4,
          address: "2 Yukon Drive Raeford, NC 28376",
          createdat: "2021-02-18T11:50:31.000000Z",
          updatedat: "2021-02-26T12:17:24.000000Z",
          lat: "1.2222",
          lng: "3.2222",
          active: "1",
          userid: "1",
          apartment: "t1",
          intercom: "",
          floor: "1",
          entry: "",
          inRadius: true,
          rangeFound: true,
          cost_per_km: "10,",
          cost_total: "50"),
      Address(
          id: 5,
          address: "3 Yukon Drive Raeford, NC 28376",
          createdat: "2021-02-18T11:50:31.000000Z",
          updatedat: "2021-02-26T12:17:24.000000Z",
          lat: "1.2222",
          lng: "3.2222",
          active: "1",
          userid: "1",
          apartment: "t1",
          intercom: "",
          floor: "1",
          entry: "",
          inRadius: true,
          rangeFound: true,
          cost_per_km: "10,",
          cost_total: "50"),
    ];
    if (addwithfeelist.isNotEmpty) {
      Address address = addwithfeelist.firstWhere((e) => e.id == widget.id, orElse: () => null);
      if (address != null) {
        deliverycost = double.parse(address.cost_total);
        deliveryaddressinfo = address;
      }
    }

    setState(() {
      loadingorder = false;
    });

    Navigator.of(context).push(CupertinoPageRoute(builder: (context) => PaymentPageMobile(timeslot: widget.timeslot)));
  }
}
