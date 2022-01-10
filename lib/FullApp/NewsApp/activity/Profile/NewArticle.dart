import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smartkit/FullApp/NewsApp/helper/ButtonClickAnimation.dart';
import 'package:smartkit/FullApp/NewsApp/helper/ColorsRes.dart';
import 'package:smartkit/FullApp/NewsApp/helper/DashedBorder/dotted_border.dart';
import 'package:smartkit/FullApp/NewsApp/helper/DesignConfig.dart';
import 'package:smartkit/FullApp/NewsApp/helper/StringsRes.dart';

class NewArticle extends StatefulWidget {
  @override
  _NewArticleState createState() => _NewArticleState();
}

class _NewArticleState extends State<NewArticle> {
  TextEditingController edttitle = new TextEditingController();
  TextEditingController edtshortdesc = new TextEditingController();
  TextEditingController edtdesc = new TextEditingController();
  TextEditingController edtcategory = new TextEditingController();
  BoxDecoration textfieldbox;

  @override
  Widget build(BuildContext context) {
    textfieldbox = DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor.withOpacity(0.15), 10);
    return Scaffold(
      backgroundColor: ColorsRes.white,
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: ColorsRes.white,
        ),
        elevation: 3,
        backgroundColor: ColorsRes.appcolor,
        centerTitle: true,
        title: Text(StringsRes.writearticle, style: TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
        actions: [
          Center(
            child: ButtonClickAnimation(
              child: Text(
                "\t${StringsRes.draft}\t\t",
                style: TextStyle(color: ColorsRes.white),
              ),
              onTap: () {},
            ),
          )
        ],
      ),
      bottomNavigationBar: IntrinsicHeight(
          child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.blue, 10),
        child: Text(
          StringsRes.publishnow,
          style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
        ),
      )),
      body: SingleChildScrollView(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15), child: newArticleForm()),
    );
  }

  Widget newArticleForm() {
    return Form(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(height: 15),
      Text(
        'Select Category',
        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
      ),
      Container(
        decoration: textfieldbox,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
        child: TextFormField(
          style: TextStyle(color: ColorsRes.white),
          cursorColor: ColorsRes.black,
          decoration: InputDecoration(
            hintText: "Type Category Name",
            hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.text,
          controller: edtcategory,
        ),
      ),
      SizedBox(height: 20),
      Text(
        StringsRes.title,
        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
      ),
      Container(
        decoration: textfieldbox,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
        child: TextFormField(
          style: TextStyle(color: ColorsRes.white),
          cursorColor: ColorsRes.black,
          decoration: InputDecoration(
            hintText: "Write a Title",
            hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: edttitle,
        ),
      ),
      SizedBox(height: 20),
      Text(
        "Short Info",
        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
      ),
      Container(
        decoration: textfieldbox,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
        child: TextFormField(
          style: TextStyle(color: ColorsRes.white),
          cursorColor: ColorsRes.black,
          decoration: InputDecoration(
            hintText: "Short information about Article",
            hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          controller: edtshortdesc,
        ),
      ),
      SizedBox(height: 20),
      Text(
        "Write Article",
        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
      ),
      Container(
        decoration: textfieldbox,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
        child: TextFormField(
          style: TextStyle(color: ColorsRes.white),
          cursorColor: ColorsRes.black,
          decoration: InputDecoration(
            hintText: "Start Writing your Article",
            hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
            border: InputBorder.none,
          ),
          keyboardType: TextInputType.multiline,
          maxLines: null,
          minLines: 8,
          controller: edtdesc,
        ),
      ),
      SizedBox(height: 20),
      Text(
        "Add Attachment",
        style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.black, fontWeight: FontWeight.bold)),
      ),
      SizedBox(height: 20),
      Container(
        decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor.withOpacity(0.1), 12),
        child: DottedBorder(
          color: ColorsRes.blue,
          dashPattern: [8],
          radius: Radius.circular(12),
          borderType: BorderType.RRect,
          child: ListTile(
            onTap: () {
              selectAttachmentMenu();
            },
            leading: Icon(Icons.add_to_photos),
            title: Text(
              "Add image, video and audio",
              style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.grey)),
            ),
          ),
        ),
      ),
    ]));
  }

  void selectAttachmentMenu() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: const Radius.circular(30), topRight: const Radius.circular(30))),
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 60,
                  height: 7,
                  margin: EdgeInsets.only(top: 20, bottom: 30),
                  decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.grey, 10),
                ),
                ButtonClickAnimation(
                  onTap: () {},
                  child: buttonWithShadow("Take Photo", "take_photo.png", ColorsRes.white, context),
                ),
                SizedBox(height: 10),
                ButtonClickAnimation(
                  onTap: () {},
                  child: buttonWithShadow("Choose Image", "gallery.png", ColorsRes.white, context),
                ),
                SizedBox(height: 10),
                ButtonClickAnimation(
                  onTap: () {},
                  child: buttonWithShadow("Upload from dropbox", "dropbox.png", ColorsRes.white, context),
                ),
                SizedBox(height: 10),
                ButtonClickAnimation(
                  onTap: () {},
                  child: buttonWithShadow("Upload from google drive", "drive.png", ColorsRes.white, context),
                ),
                SizedBox(height: 30),
              ],
            ),
          );
        });
  }

  Widget buttonWithShadow(String btntext, String image, Color btncolor, BuildContext context) {
    return SizedBox(
      //width: 242.0,
      height: 55.0,

      width: double.maxFinite,

      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: btncolor,
              boxShadow: [
                BoxShadow(
                  color: ColorsRes.appcolor.withOpacity(0.3),
                  offset: Offset(4, 4),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: btncolor,
              boxShadow: [
                BoxShadow(
                  color: ColorsRes.btnlightshadow,
                  offset: Offset(-4, -4),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                CachedNetworkImage(imageUrl: "https://smartkit.wrteam.in/smartkit/newsapp/$image"),
                SizedBox(width: 20),
                Text(btntext,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(
                          color: ColorsRes.grey,
                          decoration: TextDecoration.none,
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
