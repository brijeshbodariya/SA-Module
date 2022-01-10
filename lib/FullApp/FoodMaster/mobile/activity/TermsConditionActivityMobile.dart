import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/FoodMaster/mobile/helper/DesignConfig.dart';

class TermsConditionActivityMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: ColorsRes.bgcolor,
        appBar: DesignConfig.setAppbar("Terms and Conditions"),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text("Terms and Conditions & Privacy policy"),
                )),
          ),
        ));
  }
}

class TermsConditionPageMobile extends StatefulWidget {
  @override
  TermsDataMobile createState() {
    return TermsDataMobile();
  }
}

class TermsDataMobile extends State<TermsConditionPageMobile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Terms and Conditions"),
    );
  }
}
