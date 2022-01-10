import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/Constant.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/StringsRes.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:smartkit/FullApp/FoodMaster/helper/googleplaces/flutter_google_places.dart';
import 'package:smartkit/FullApp/FoodMaster/model/Address.dart';

import 'AddressList.dart';

class AddNewAddress extends StatefulWidget {
  final List address;

  const AddNewAddress({Key key, this.address}) : super(key: key);
  @override
  _AddNewAddressState createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController edtlongitude = TextEditingController();
  TextEditingController edtlattitude = TextEditingController();
  TextEditingController edtaddress = TextEditingController();
  TextEditingController edtapartment = TextEditingController();
  TextEditingController edtintercom = TextEditingController();
  TextEditingController edtfloor = TextEditingController();
  TextEditingController edtentry = TextEditingController();
  bool isloading = false;
  /* List<Address> addresslist=[(
      Address(id:1,address:"6 Yukon Drive Raeford, NC 28376",createdat:"2021-02-18T11:50:31.000000Z",updatedat:"2021-02-26T12:17:24.000000Z",lat:"1.2222",lng:"3.2222",active:"1",userid:"1",apartment:"t1",intercom:"",floor:"1",entry:"",inRadius:true,rangeFound:true,cost_per_km:"10,",cost_total:"50")),
    Address(id:2,address:"8 Sardar nagar",createdat:"2021-02-18T11:50:31.000000Z",updatedat:"2021-02-26T12:17:24.000000Z",lat:"1.2222",lng:"3.2222",active:"1",userid:"1",apartment:"t1",intercom:"",floor:"1",entry:"",inRadius:true,rangeFound:true,cost_per_km:"10,",cost_total:"50"),
    Address(id:3,address:"9 Yukon Drive Raeford, NC 28376, NC 28376",createdat:"2021-02-18T11:50:31.000000Z",updatedat:"2021-02-26T12:17:24.000000Z",lat:"1.2222",lng:"3.2222",active:"1",userid:"1",apartment:"t1",intercom:"",floor:"1",entry:"",inRadius:true,rangeFound:true,cost_per_km:"10,",cost_total:"50"),
    Address(id:4,address:"2 Yukon Drive Raeford, NC 28376",createdat:"2021-02-18T11:50:31.000000Z",updatedat:"2021-02-26T12:17:24.000000Z",lat:"1.2222",lng:"3.2222",active:"1",userid:"1",apartment:"t1",intercom:"",floor:"1",entry:"",inRadius:true,rangeFound:true,cost_per_km:"10,",cost_total:"50"),
    Address(id:5,address:"3 Yukon Drive Raeford, NC 28376",createdat:"2021-02-18T11:50:31.000000Z",updatedat:"2021-02-26T12:17:24.000000Z",lat:"1.2222",lng:"3.2222",active:"1",userid:"1",apartment:"t1",intercom:"",floor:"1",entry:"",inRadius:true,rangeFound:true,cost_per_km:"10,",cost_total:"50"),

  ];*/
  Address address;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: Constant.googleApiKey);
  void initState() {
    super.initState();
    /* for(int i=0;i<addresslist.length;i++){
     address=addresslist[i];
   }*/
    for (int i = 0; i < widget.address.length; i++) {
      address = widget.address[i];
      print(address.address);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: DesignConfig.setAppbar(StringsRes.addaddress),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 8),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                FlatButton(
                    shape: DesignConfig.setRoundedBorder(ColorsRes.appcolor, 10, false),
                    onPressed: () async {
                      Prediction p = await PlacesAutocomplete.show(context: context, apiKey: Constant.googleApiKey, onError: onError);
                      displayPrediction(p);
                    },
                    child: Text(StringsRes.filladdressfromsearch)),
                SizedBox(height: 15),
                TextFormField(
                  style: Theme.of(context).textTheme.button,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsRes.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 15, top: 2, bottom: 2),
                      hintText: StringsRes.address,
                      labelText: StringsRes.address,
                      hintStyle: TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.normal)),
                  controller: edtaddress,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: Theme.of(context).textTheme.button,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsRes.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 15, top: 2, bottom: 2),
                      hintText: StringsRes.lattitude,
                      labelText: StringsRes.lattitude,
                      hintStyle: TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.normal)),
                  controller: edtlattitude,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: Theme.of(context).textTheme.button,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsRes.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 15, top: 2, bottom: 2),
                      hintText: StringsRes.longitude,
                      labelText: StringsRes.longitude,
                      hintStyle: TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.normal)),
                  controller: edtlongitude,
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: Theme.of(context).textTheme.button,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsRes.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 15, top: 2, bottom: 2),
                      hintText: StringsRes.apartment,
                      labelText: StringsRes.apartment,
                      hintStyle: TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.normal)),
                  controller: edtapartment,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: Theme.of(context).textTheme.button,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsRes.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 15, top: 2, bottom: 2),
                      hintText: StringsRes.intercom,
                      labelText: StringsRes.intercom,
                      hintStyle: TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.normal)),
                  controller: edtapartment,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: Theme.of(context).textTheme.button,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsRes.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 15, top: 2, bottom: 2),
                      hintText: StringsRes.floor,
                      labelText: StringsRes.floor,
                      hintStyle: TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.normal)),
                  controller: edtfloor,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: Theme.of(context).textTheme.button,
                  decoration: new InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsRes.grey,
                        ),
                      ),
                      contentPadding: EdgeInsets.only(left: 15, top: 2, bottom: 2),
                      hintText: StringsRes.entry,
                      labelText: StringsRes.entry,
                      hintStyle: TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.normal)),
                  controller: edtentry,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 30,
                ),
                if (isloading)
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new CircularProgressIndicator(),
                  )),
                GestureDetector(
                  onTap: () async {
                    // addresslist.clear();
                    Map data = {
                      //  address.id :address.id+1,

                      address.address: edtaddress.text,
                      address.lat: edtlattitude.text,
                      address.lng: edtlongitude.text,
                      address.apartment: edtapartment.text,
                      address.intercom: edtintercom.text,
                      address.floor: edtfloor.text,
                      address.entry: edtentry.text,
                    };

                    print(data);
                    //address.id =address.id+1;
                    address.address = edtaddress.text;
                    address.lat = edtlattitude.text;
                    address.lng = edtlongitude.text;
                    address.apartment = edtapartment.text;
                    address.intercom = edtintercom.text;
                    address.floor = edtfloor.text;
                    address.entry = edtentry.text;
                    address.active = "1";
                    address.cost_per_km = "";
                    address.cost_total = "";
                    widget.address.insert(0, address);
                    Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (context) => AddressList()));
                  },
                  child: DesignConfig.shadowButtonFullwidgth(ColorsRes.appcolor, StringsRes.lbladd, ColorsRes.white, 25, ColorsRes.appcolor, context),
                )
              ],
            ),
          ),
        ));
  }

  void onError(PlacesAutocompleteResponse response) {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text("Search")),
    );
  }

  Future<Null> displayPrediction(Prediction p) async {
    PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
    final lat = detail.result.geometry.location.lat;
    final long = detail.result.geometry.location.lng;

    var address = detail.result.formattedAddress;

    print(lat);
    print(long);
    print(address);

    setState(() {
      edtaddress.text = address;
      edtlattitude.text = lat.toString();
      edtlongitude.text = long.toString();
    });
  }
}
