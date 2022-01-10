import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/StringsRes.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/Constant.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/UIData.dart';
import 'package:smartkit/FullApp/CryptoTech/helper/searchable_dropdown.dart';
import 'package:smartkit/FullApp/CryptoTech/model/Country.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:smartkit/FullApp/CryptoTech/activity/AirTimeRecharge/AirTimeOperatorList.dart';

String selectedphoneno;
Country selectedcountry;

class PhoneNumberScreen extends StatefulWidget {
  @override
  PhoneNumberScreenState createState() => new PhoneNumberScreenState();
}

class PhoneNumberScreenState extends State<PhoneNumberScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Country> countrylist;
  TextEditingController edtphone = new TextEditingController(text: UIData.usermobileno);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    countrylist = [];
    countrylist = UIData.getCountryList();
    selectedcountry = countrylist[0];
  }

  @override
  Widget build(BuildContext context) {
    double toppadding = kToolbarHeight + 40;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: ColorsRes.bgcolor,
      body: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              gradient: DesignConfig.gradient,
            ),
            padding: EdgeInsets.only(top: toppadding),
            child: Container(
                padding: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  color: ColorsRes.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(18), topLeft: Radius.circular(18)),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  child: ContentWidget(),
                )),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: IntrinsicHeight(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(StringsRes.airtimerecharge, style: TextStyle(color: ColorsRes.white)),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CachedNetworkImage(imageUrl: 'https://smartkit.wrteam.in/smartkit/cryptotech/back_button.png'),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget ContentWidget() {
    return Form(
      key: _formKey,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(alignment: Alignment.centerRight, child: Text("${StringsRes.airtimepoints} : ${UIData.airtimepoints}", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)))),
        Text("${StringsRes.setphonenumber}", style: Theme.of(context).textTheme.headline6.merge(TextStyle(color: ColorsRes.firstgradientcolor, fontWeight: FontWeight.bold))),
        SizedBox(
          height: 20,
        ),
        Text("${StringsRes.lblcountry}", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold))),
        Card(
          shape: DesignConfig.SetRoundedBorder(ColorsRes.grey, 8),
          child: SearchableDropdown<Country>(
            isCaseSensitiveSearch: false,
            isExpanded: true,
            value: selectedcountry,
            onChanged: (Country newValue) {
              setState(() {
                if (selectedcountry.isoName != newValue.isoName) {
                  selectedcountry = newValue;
                }
              });
            },
            items: countrylist.map((Country value) {
              return DropdownMenuItem<Country>(
                value: value,
                child: Row(
                  children: [
                    Expanded(flex: 1, child: WebsafeSvg.network(value.flag, width: 25, height: 25)),
                    SizedBox(width: 10),
                    Expanded(flex: 3, child: Text("${value.name}", style: TextStyle(color: ColorsRes.black, fontWeight: FontWeight.w500))),
                  ],
                ), // (${value.code})"),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text("${StringsRes.phonenumber}", style: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey, fontWeight: FontWeight.bold))),
        Container(
          decoration: DesignConfig.outlineboxtext,
          padding: EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
          child: TextFormField(
            style: TextStyle(color: ColorsRes.black, fontSize: 14),
            cursorColor: ColorsRes.appcolor,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              hintText: '${StringsRes.mobile_number}',
              hintStyle: TextStyle(color: ColorsRes.grey),
            ),
            keyboardType: TextInputType.phone,
            validator: (val) => Constant.validateMobile(val),
            controller: edtphone,
          ),
        ),
        SizedBox(height: 25),
        GestureDetector(
            onTap: () {
              if (_formKey.currentState.validate()) {
                selectedphoneno = edtphone.text;
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AirTimeOperatorList()));
              }
            },
            child: DesignConfig.EnDisButton(StringsRes.next, ColorsRes.white, context)),
      ]),
    );
  }
}
