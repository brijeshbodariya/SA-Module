import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/StringsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/CartPayment/PaymentAddressPageMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/activity/profile/AddNewAddressMobile.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Address.dart';

StreamController<String> addressstreamdata;
List<Address> addresslist = [
  (Address(
      id: 0,
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
      id: 1,
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
      id: 2,
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
      id: 3,
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
      id: 4,
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

class AddressListMobile extends StatefulWidget {
  final bool fromcart;
  const AddressListMobile({
    Key key,
    this.fromcart,
  }) : super(key: key);
  @override
  _AddressListStateMobile createState() => _AddressListStateMobile();
}

class _AddressListStateMobile extends State<AddressListMobile> {
  bool isgettingdata = true;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  String errMsg = '';

  @override
  void initState() {
    super.initState();
    getData();
    setupChannel();
  }

  void setupChannel() {
    addressstreamdata = StreamController<String>();
    addressstreamdata.stream.listen((response) {
      //getData();
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (addressstreamdata != null && !addressstreamdata.isClosed) addressstreamdata.sink.close();
    super.dispose();
  }

  getData() async {
    addresslist;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: DesignConfig.setAppbar(StringsRes.deliveryaddress),
      bottomNavigationBar: IntrinsicHeight(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => AddNewAddressMobile(address: addresslist)));
          },
          child: DesignConfig.shadowButtonFullwidgth(ColorsRes.appcolor, StringsRes.addnewaddress, ColorsRes.white, 20, ColorsRes.appcolor, context),
        ),
      ),
      body: addListWidget(),
    );
  }

  addListWidget() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: addresslist.length,
      itemBuilder: (context, index) {
        Address address = addresslist[index];
        return ListTile(
          tileColor: ColorsRes.bgcolor,
          leading: Icon(
            Icons.location_on,
            color: ColorsRes.IconColor,
          ),
          title: Text(address.address),
          trailing: GestureDetector(
            onTap: () {
              deleteAddress(index, address.id.toString());
            },
            child: Icon(
              Icons.delete,
              color: ColorsRes.red,
            ),
          ),
          onTap: () {
            print("=id==${address.id}");
            if (widget.fromcart) {
              //if (paymentstreamdata != null && !paymentstreamdata.isClosed) {
              paymentstreamdata.sink.add("");
              //  }
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  void deleteAddress(int index, String id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: DesignConfig.setRoundedBorder(ColorsRes.appcolor, 20, false),
          title: Text(StringsRes.lbldelete),
          content: Text(StringsRes.lbldeletemsg),
          actions: [
            TextButton(
              child: Text(
                StringsRes.lblcancel,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                child: Text(
                  StringsRes.lbldelete,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () async {
                  addresslist.removeAt(index);
                  setState(() {});
                  String message = '';
                  scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(message)));
                  Navigator.of(context).pop();
                  Future.delayed(Duration(seconds: 1), () {
                    scaffoldKey.currentState.removeCurrentSnackBar();
                  });
                }),
          ],
        );
      },
    );
  }
}
