import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';
import 'package:smartkit/integration/helper/DesignConfig.dart';
import 'package:smartkit/integration/helper/Constant.dart';

class HttpGetPostRequestWithUploadingFilesTablet extends StatefulWidget {
  HttpGetPostRequestWithUploadingFilesTablet({Key key, this.title}) : super(key: key);
  final String title;
  @override
  HttpGetPostRequestWithUploadingFilesStateTablet  createState() =>HttpGetPostRequestWithUploadingFilesStateTablet();
}

class HttpGetPostRequestWithUploadingFilesStateTablet extends State< HttpGetPostRequestWithUploadingFilesTablet> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  String userimage = '';
  File image,data;
  var isLoading,isslideravailabe,pro;
  TextEditingController editName = new TextEditingController();
  TextEditingController editMobile = new TextEditingController();
  bool useMobileLayout;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.initState();
  }
  Future  addProfileImage(File images) async {
    bool checkinternet = await Constant.CheckInternet();
    if (!checkinternet) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Check Internet Connection")));
    } else {
      Map<String, String> body = {
      };
      Map<String, File> filelist = {
      };
      var response = await Constant.postApiFile("", filelist, context, body);
      final res = json.decode(response);
      if (!res['error']) {
        userimage = res[''][''];
      }
      setState(() {
        isslideravailabe = !res['error'];
      });
    }
  }

  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      addProfileImage(image);
    }
  }

  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
      addProfileImage(image);
    }
  }
  void _showPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
                height: 150, width: 100,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextButton(onPressed:  () {
                          _getFromGallery();
                          Navigator.of(context).pop();
                        }, child:  Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
                          child: Row(
                            children: [
                              SizedBox(width:20),
                              Icon(Icons.photo_library, color: ColorsRes.white,),
                              SizedBox(width: 20),
                              Text("Photo Library", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        )),
                        TextButton(onPressed:  () {
                          _getFromCamera();
                          Navigator.of(context).pop();
                        }, child:  Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
                          child: Row(
                            children: [
                              SizedBox(width: 20),
                              Icon(Icons.photo_camera, color: ColorsRes.white,),
                              SizedBox(width: 20),
                              Text("Camera", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        )),
                      ]
                  ),
                )
            )
        );
      },
    );
  }

  Future editProfileData(String name,String mobile) async {
    bool checkinternet = await Constant.CheckInternet();
    if (!checkinternet) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Check Internet Connection")));
    } else {
      Map<String, String> body = {
      };
      var response = await Constant.PostApiData("", body, context);
      final res = json.decode(response);
      if (!res['error']) {}
      setState(() {
        isslideravailabe = !res['error'];
      });
    }
  }


  @override
  Widget build(BuildContext context){
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    useMobileLayout = shortestSide < 600;
    return Scaffold(
      appBar: AppBar(title:  Text("Http Get/Post Request With Uploading Files",style: TextStyle(color: Colors.black)),backgroundColor: Colors.white,leading: BackButton(
          color: Colors.black
      ),),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    child: SingleChildScrollView(
                        child:Column(
                            children: [
                              Stack(
                                  children: [
                                    Container(
                                      height: MediaQuery.of(context).size.height * .25,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          stops: [0.1, 0.6, 0.9],
                                          colors: [
                                            ColorsRes.appcolor_material[200],
                                            ColorsRes.appcolor_material[200],
                                            ColorsRes.appcolor_material[300],
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                        margin: new EdgeInsets.only(top: useMobileLayout ? MediaQuery.of(context).size.height * .15 : MediaQuery.of(context).size.height * .18, right: 20.0, left: 20.0),
                                        alignment: Alignment.center,
                                        child: CircleAvatar(
                                          radius: 70,
                                          backgroundColor: ColorsRes.appcolor,
                                          child:  image != null ? ClipOval(child: Image.file(image, width: 135, height: 135, fit: BoxFit.fill,
                                          ),
                                          ) : Container(child: ClipOval(child: userimage.isNotEmpty? FadeInImage.assetNetwork(image: userimage, placeholder: "https://smartkit.wrteam.in/smartkit/images/profile2.png", width: 135, height: 135, fit: BoxFit.fill,) : Image.network("https://smartkit.wrteam.in/smartkit/images/profile2.png", width: 135, height: 135, fit: BoxFit.cover,)),
                                          ),
                                        )
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context).size.height /4,
                                            left: MediaQuery.of(context).size.height /2.9),
                                        child: FloatingActionButton(
                                          mini: true,
                                          child: Icon(Icons.edit),
                                          onPressed: () async {
                                            _showPicker();
                                          },
                                          backgroundColor: ColorsRes.appcolor,)
                                    ),
                                  ]
                              ),
                              new SizedBox(height: 10),
                              Container(
                                decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor.withOpacity(0.1), 15),
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(top: 20, bottom: 5,left: 20,right:20),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: "Enter Name",
                                    hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  minLines: 1,
                                  controller: editName,
                                ),
                              ),
                              Container(
                                decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor.withOpacity(0.1), 15),
                                padding: EdgeInsets.all(8),
                                margin: EdgeInsets.only(top: 20, bottom: 5,left: 20,right:20),
                                child: TextFormField(
                                  style: TextStyle(color: ColorsRes.black),
                                  cursorColor: ColorsRes.black,
                                  decoration: InputDecoration(
                                    hintText: "Enter Mobile",
                                    hintStyle: Theme.of(context).textTheme.subtitle2.merge(TextStyle(color: ColorsRes.grey)),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  minLines: 1,
                                  controller: editMobile,
                                ),
                              ),
                              SizedBox(height:20),
                              GestureDetector(
                                onTap:(){
                                  editProfileData(editName.text,editMobile.text);
                                  editName.clear();
                                  editMobile.clear();
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
                                  child: Text("Sign Up", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),),
                                ),
                              ),
                            ]
                        )
                    ),
                  ),
                ]
            ),
          )
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}