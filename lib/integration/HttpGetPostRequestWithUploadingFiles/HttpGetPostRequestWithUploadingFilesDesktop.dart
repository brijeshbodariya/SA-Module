import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:smartkit/integration/helper/ColorsRes.dart';
import 'package:smartkit/integration/helper/DesignConfig.dart';
import 'package:smartkit/integration/helper/Constant.dart';
import 'package:http/http.dart' as http;


class HttpGetPostRequestWithUploadingFilesDesktop extends StatefulWidget {
  HttpGetPostRequestWithUploadingFilesDesktop({Key key, this.title}) : super(key: key);
  final String title;
  @override
  HttpGetPostRequestWithUploadingFilesStateDesktop  createState() =>HttpGetPostRequestWithUploadingFilesStateDesktop();
}

class HttpGetPostRequestWithUploadingFilesStateDesktop extends State< HttpGetPostRequestWithUploadingFilesDesktop> {
  final GlobalKey<FormState> key = GlobalKey<FormState>();
  String userimage = '';
  File image,data;
  var isLoading,isslideravailabe,pro;
  TextEditingController editName = new TextEditingController();
  TextEditingController editMobile = new TextEditingController();
  bool useMobileLayout;
  PlatformFile objFile = null;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.initState();
  }


  void chooseFileUsingFilePicker() async {
    var result = await FilePicker.platform.pickFiles(
      withReadStream:
      true,
    );
    if (result != null) {
      setState(() {
        objFile = result.files.single;
      });
    }
  }

  void uploadSelectedFile() async {
    var request;
    String url = "";
    if(url.isNotEmpty)
      request = http.MultipartRequest("POST", Uri.parse(url),);
    else
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Pleas add url")));
    request.fields[''] = '';
    request.fields[''] = "";
    request.files.add(new http.MultipartFile("", objFile.readStream, objFile.size, filename: objFile.name));
    var resp = await request.send();
    String result = await resp.stream.bytesToString();
    print(result);
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
      body: Center(
        child: SizedBox(width: 600, height: 450,
          child: Container(color: ColorsRes.bgcolor,padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: SingleChildScrollView(
                            child:Column(
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: ()
                                        {
                                          chooseFileUsingFilePicker();
                                        },
                                        child: Container(width: 200,
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(vertical: 15),
                                          margin: EdgeInsets.symmetric(horizontal: 20),
                                          decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
                                          child: Text("Choose File", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),),
                                        ),
                                      ),
                                      if (objFile != null) Expanded(child: Text(objFile.name,style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.appcolor, fontWeight: FontWeight.bold)),overflow: TextOverflow.ellipsis,maxLines: 1,)),
                                    ],
                                  ),
                                  new SizedBox(height: 10),
                                  GestureDetector(
                                    onTap:()
                                    {
                                      uploadSelectedFile();
                                    },
                                    child: Align(alignment: Alignment.centerLeft,
                                      child: Container(width: 200,
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(vertical: 15),
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        decoration: DesignConfig.boxDecorationContainerColor(ColorsRes.appcolor, 10),
                                        child: Text("Upload", style: Theme.of(context).textTheme.subtitle1.merge(TextStyle(color: ColorsRes.white, fontWeight: FontWeight.bold)),),
                                      ),
                                    ),
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
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}